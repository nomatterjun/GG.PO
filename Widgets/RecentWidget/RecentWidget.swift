//
//  RecentWidget.swift
//  Widgets
//
//  Created by 이창준 on 6/11/23.
//

import SwiftData
import SwiftUI
import WidgetKit

struct RecentWidget: Widget {
    private let kind: String = "com.letusgo-hack.GGPO.RecentWidget"

    var families: [WidgetFamily] {
        return [.systemMedium]
    }

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: self.kind,
                               intent: RecentWidgetIntent.self,
                               provider: RecentWidgetProvider()
        ) { entry in
            RecentWidgetEntryView(entry: entry)
                .modelContainer(Summoner.container)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("최근 전적")
        .description("최근 전적을 추적해보세요.")
        .supportedFamilies(families)
    }
}
