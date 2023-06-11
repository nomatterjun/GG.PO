//
//  RecentWidgetInfoView.swift
//  GGPO
//
//  Created by 이창준 on 6/10/23.
//

import SwiftUI
import WidgetKit

struct RecentWidgetInfoView: View {
    @State var matches: [Match]

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("오늘 승률")
                    .font(.system(size: 16, weight: .bold))

                let todayRecords = self.matches.filter { $0.date.isToday }
                if todayRecords.count != 0 {
                    let wonTodayRecords = todayRecords.filter { $0.isWin }
                    let winRate = round(Double(wonTodayRecords.count) / Double(todayRecords.count) * 100)
                    Text(String(Int(winRate)) + "%")
                        .font(.system(size: 32, weight: .bold))
                } else {
                    Text("기록 없음")
                        .font(.system(size: 24, weight: .bold))
                }
            }

            Button(action: {
                print("Button Tapped")
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
    RecentWidgetInfoView(matches: [Match(date: .now, isWin: true)])
}
