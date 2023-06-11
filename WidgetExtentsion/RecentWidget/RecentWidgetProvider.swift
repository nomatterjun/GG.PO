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
        Entry(date: .now, matches: [], relevance: TimelineEntryRelevance(score: 1.0))
    }

    func getSnapshot(for configuration: DynamicSummonerSelectionIntent, in context: Context, completion: @escaping (RecentWidgetEntry) -> Void) {
        let entry = RecentWidgetEntry(date: .now, matches: [Match(date: .now, isWin: true)], relevance: TimelineEntryRelevance(score: 1.0))
        completion(entry)
    }

    func getTimeline(for configuration: DynamicSummonerSelectionIntent, in context: Context, completion: @escaping (Timeline<RecentWidgetEntry>) -> Void) {

        let fiveMinutes: TimeInterval = 60 * 5
        var currentDate: Date = .now

        // 실제 데이터 받아오기
        let selectedPUUID = self.puuid(for: configuration)
        var entries: [RecentWidgetEntry] = []

        // 5분마다 갱신
        // 1시간 분량의 Entry 생성
        for _ in (1...12) {
            // TODO: Relevance 설정
            let relevance = TimelineEntryRelevance(score: 1.0)
            let entry = RecentWidgetEntry(date: currentDate,
                                          matches: [],
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
