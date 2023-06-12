//
//  RecentWidgetEntryView.swift
//  Widgets
//
//  Created by 이창준 on 6/11/23.
//

import SwiftData
import SwiftUI

struct RecentWidgetEntryView: View {
    var entry: RecentWidgetProvider.Entry
    @Query private var summoners: [Summoner]

    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            let summoner = self.entry.configuration.summoner
            if let selectedSummoner = summoners.first(where: { $0.puuid == summoner.puuid }) {
                let _ = print(selectedSummoner.matches.map { $0.date })
                RecentWidgetInfoView(matches: selectedSummoner.matches)
                RecentWidgetRecordsView(matches: selectedSummoner.matches)
            } else {
                Text("등록된 소환사 정보가 없습니다.")
                    .foregroundStyle(.gray)
            }
        }
        .containerBackground(.white, for: .widget)
    }
}
