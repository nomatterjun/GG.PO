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
                GPTextField(text: self.$text)
                    .focused(self.$isFocused)

                Button("Start") {
                    self.isFocused = false
                    Task {
                        do {
                            let summoner = try await self.urlSession.fetchSummoner(by: self.text)
                            modelContext.insert(summoner)
                            let matchIDs = try await self.urlSession.fetchRecentMatches(by: summoner.puuid)
                            for matchID in matchIDs {
                                let match = try await self.urlSession.fetchMatch(matchID)
                                modelContext.insert(match)
                            }
                            let summoners = try! modelContext.fetch(FetchDescriptor<Summoner>())
                            print(summoners.map { $0.name })
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
            print(try! ModelContext(Summoner.container).fetch(FetchDescriptor<Summoner>()).map { $0.name })
        }
        .onTapGesture {
            self.isFocused = false
        }
    }
}

#Preview {
    ContentView()
}
