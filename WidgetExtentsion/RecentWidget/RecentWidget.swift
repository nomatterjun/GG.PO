//
//  RecentWidget.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import SwiftUI
import WidgetKit

struct RecentWidget: Widget {
    let kind: String = "com.letusgo-hack.GGPO.RecentWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: self.kind,
                            intent: DynamicSummonerSelectionIntent.self,
                            provider: RecentWidgetProvider()
        ) { entry in
            RecentWidgetEntryView(entry: entry)
                .containerBackground(.background.tertiary, for: .widget)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("최근 전적")
        .description("최근 전적과 오늘의 승률을 보여주는 위젯입니다.")
        .supportedFamilies([.systemMedium])
//        .onBackgroundURLSessionEvents { identifier, completion in
//            <#code#>
//        }
    }
}

#Preview(as: .systemMedium) {
    RecentWidget()
} timeline: {
    RecentWidgetEntry(date: .now,
                      matches: [

                      ],
                      relevance: TimelineEntryRelevance(score: 1.0))
}
