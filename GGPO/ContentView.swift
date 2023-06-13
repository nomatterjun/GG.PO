//
//  ContentView.swift
//  GGPO
//
//  Created by Lee on 2023/06/10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    private let urlSession = URLSessionService()

    @Environment(\.modelContext) private var modelContext

    @FocusState private var isFocused: Bool
    @State private var givenName: String = ""

    @State private var text: String = ""
    @State private var tapped: Bool = false

    @State private var networkDone: Bool = false

    var body: some View {
        VStack {
            VStack(spacing: 4) {
                Text("League of Legends")
                    .font(.system(size: 24, weight: .bold))

                Text("Win Streaks Tracker")
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(.top, 48)

            Spacer()

            VStack(spacing: 24) {
                if $networkDone.wrappedValue {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .animation(.bouncy, value: true)
                } else {
                    Image(systemName: "circle.dotted")
                }

                GPTextField(text: self.$text)
                    .focused(self.$isFocused)

                Button("Start") {
                    self.isFocused = false
                    Task {
                        do {
                            let summoner = try await self.urlSession.fetchSummoner(by: self.text)
                            let matchIDs = try await self.urlSession.fetchRecentMatches(by: summoner.puuid)
                            for matchID in matchIDs {
                                let match = try await self.urlSession.fetchMatch(matchID)
                                print(match.date)
                                modelContext.insert(match)
                                summoner.matches.append(match)
                            }
                            print(summoner.matches.map { $0.date })
                            modelContext.insert(summoner)
                            try? modelContext.save()
                            networkDone = true

                            let matches = try! modelContext.fetch(FetchDescriptor<Match>())
                            print(matches.map { $0.gameID })
                        } catch {
                            print(error)
                        }
                    }
                }
                .buttonStyle(GPButtonStyle(backgroundColor: .primary, foreGroundColor: .white))
            }

            Spacer()
        }
        .background(.white)
        .padding(.horizontal)
        .onAppear {
            self.isFocused = true
            modelContext.autosaveEnabled = true
        }
        .onTapGesture {
            self.isFocused = false
        }
    }
}

#Preview {
    ContentView()
}
