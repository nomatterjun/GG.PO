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
        StaticConfiguration(kind: self.kind,
                            provider: RecentWidgetProvider()
        ) { entry in
            RecentWidgetEntryView(entry: entry)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("최근 전적")
        .description("최근 전적과 오늘의 승률을 보여주는 위젯입니다.")
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemMedium) {
    RecentWidget()
} timeline: {
    RecentWidgetEntry(date: .now,
                      records: [
                        Record(date: .now, isWin: true)
                      ])
}
