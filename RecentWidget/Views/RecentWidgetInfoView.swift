//
//  RecentWidgetInfoView.swift
//  Widgets
//
//  Created by 이창준 on 6/10/23.
//

import SwiftUI
import WidgetKit

struct RecentWidgetInfoView: View {
    var matches: [Match]

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("오늘 승률")
                    .font(.system(size: 16, weight: .bold))

//                let todayRecords = self.matches.filter { $0.date.isToday }
                if matches.count != 0 {
                    let wonTodayRecords = matches.filter { $0.isWin }
                    let winRate = round(Double(wonTodayRecords.count) / Double(matches.count) * 100)
                    Text(String(Int(winRate)) + "%")
                        .font(.system(size: 32, weight: .bold))
                } else {
                    Text("기록 없음")
                        .font(.system(size: 24, weight: .bold))
                }
            }

            Button(action: {
                print(self.matches)
            }, label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.green)
            })
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    RecentWidgetInfoView(matches: [Match.random()])
}
