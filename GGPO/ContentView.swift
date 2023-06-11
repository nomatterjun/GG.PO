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
                            print(summoner)
                        } catch {
                            //
                        }
                    }
                }
                .buttonStyle(GPButtonStyle(backgroundColor: .primary, foreGroundColor: .white))
            }

            Spacer()
        }
        .background(.white)
        .padding(.horizontal, 24)
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
