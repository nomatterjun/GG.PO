//
//  RecentWidgetProvider.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import SwiftUI
import WidgetKit

struct RecentWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> RecentWidgetEntry {
        RecentWidgetEntry(date: .now, records: [])
    }

    func getSnapshot(in context: Context, completion: @escaping (RecentWidgetEntry) -> Void) {
        let entry = RecentWidgetEntry(date: .now, records: [Record(date: .now, isWin: true)])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<RecentWidgetEntry>) -> Void) {
        let entries: [RecentWidgetEntry] = [
            RecentWidgetEntry(date: .now, records: [
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: false),
                Record(date: .now, isWin: true),
                Record(date: .now, isWin: true)
            ])
        ]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
