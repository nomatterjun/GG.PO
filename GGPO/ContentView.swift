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

                    let context = try! ModelContext(ModelContainer(for: Summoner.self))
                    Task {
                        do {
                            let summoner = try await self.urlSession.fetchSummoner(by: self.text)
                            modelContext.insert(summoner)
                            let summoners = try! modelContext.fetch(FetchDescriptor<Summoner>())
                            print(summoners.map { $0.name })
                        } catch {
                            if try! context.fetch(FetchDescriptor<Summoner>()).isEmpty {
                                context.insert(Summoner.random())
                                try! context.save()
                            }
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
        }
        .onTapGesture {
            self.isFocused = false
        }
    }
}

#Preview {
    ContentView()
}
