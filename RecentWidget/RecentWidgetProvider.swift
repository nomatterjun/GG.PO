//
//  RecentWidgetProvider.swift
//  Widgets
//
//  Created by 이창준 on 6/11/23.
//

import SwiftData
import SwiftUI
import WidgetKit
import OSLog

private let logger = Logger(subsystem: "WidgetExtension", category: "RecentWidgetProvider")

struct RecentWidgetProvider: AppIntentTimelineProvider {
    let modelContext = ModelContext(Summoner.container)

    init() {
        Summoner.generateData(modelContext: modelContext)
    }

    func placeholder(in context: Context) -> RecentWidgetEntry {
        if let summoner = try? modelContext.fetch(FetchDescriptor<Summoner>()).first {
            RecentWidgetEntry(date: .now,
                              configuration: RecentWidgetIntent(summoner: SummonerEntity(from: summoner)))
        } else {
            RecentWidgetEntry(date: .now,
                              configuration: RecentWidgetIntent(summoner: SummonerEntity(id: "1q2w", name: "Hide on bush")))
        }
    }

    func snapshot(for configuration: RecentWidgetIntent, in context: Context) async -> RecentWidgetEntry {
        return RecentWidgetEntry(date: .now, configuration: configuration)
    }

    func timeline(for configuration: RecentWidgetIntent, in context: Context) async -> Timeline<RecentWidgetEntry> {
        let fiveMinutes: TimeInterval = 60 * 5
        var currentDate: Date = .now

        var entries: [RecentWidgetEntry] = []

        // 5분마다 갱신
        // 1시간 분량의 Entry 생성
        for _ in (1...12) {
            // TODO: Relevance 설정
            let entry = RecentWidgetEntry(date: currentDate,
                                          configuration: configuration)
            currentDate += fiveMinutes
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

private extension RecentWidgetProvider {
    func matches(for configuration: RecentWidgetIntent) -> [Match] {
        let puuid = configuration.summoner!.id
        if let summoner = try! self.modelContext.fetch(
            FetchDescriptor<Summoner>(predicate: #Predicate { $0.puuid == puuid })
        ).first {
            return summoner.matches
        }
        return []
    }
}
