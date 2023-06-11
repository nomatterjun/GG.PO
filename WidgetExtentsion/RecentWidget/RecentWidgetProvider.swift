//
//  RecentWidgetProvider.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation
import SwiftUI
import WidgetKit

struct RecentWidgetProvider: IntentTimelineProvider {
    typealias Entry = RecentWidgetEntry
    typealias Intent = DynamicSummonerSelectionIntent

    func placeholder(in context: Context) -> Entry {
        Entry(date: .now, records: [], relevance: TimelineEntryRelevance(score: 1.0))
    }

    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        let entry = Entry(date: .now, records: [Record(date: .now, isWin: true)], relevance: TimelineEntryRelevance(score: 1.0))
        completion(entry)
    }

    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {

        let fiveMinutes: TimeInterval = 60 * 5
        var currentDate: Date = .now

        // 실제 데이터 받아오기
        let selectedPUUID = self.puuid(for: configuration)
        var entries: [Entry] = []

        // 5분마다 갱신
        // 1시간 분량의 Entry 생성
        for _ in (1...12) {
            // TODO: Relevance 설정
            let relevance = TimelineEntryRelevance(score: 1.0)
            let entry = Entry(date: currentDate,
                                          records: [],
                                          relevance: relevance)
            currentDate += fiveMinutes
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

private extension RecentWidgetProvider {
    func puuid(for configuration: DynamicSummonerSelectionIntent) -> String {
        guard let puuid = configuration.summoner?.identifier else { fatalError() }
        return puuid
    }
}
