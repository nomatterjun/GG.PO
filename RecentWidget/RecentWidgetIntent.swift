//
//  RecentWidgetIntent.swift
//  Widgets
//
//  Created by 이창준 on 6/12/23.
//

import WidgetKit
import AppIntents
import SwiftData
import OSLog

private let logger = Logger(subsystem: "WidgetExtension", category: "RecentWidgetIntent")

struct RecentWidgetIntent: WidgetConfigurationIntent {
    static let title: LocalizedStringResource = "최근 전적"
    static let description = IntentDescription("최근 전적과 오늘의 승률을 보여주는 위젯입니다.")

    @Parameter(title: "Summoner")
    var summoner: SummonerEntity

    init(summoner: SummonerEntity) {
        self.summoner = summoner
    }

    init() { }
}

struct SummonerEntity: AppEntity, Identifiable, Hashable {
    var id: Summoner.ID
    var name: String

    init(id: Summoner.ID, name: String) {
        self.id = id
        self.name = name
    }

    init(from summoner: Summoner) {
        self.id = summoner.puuid
        self.name = summoner.name
    }

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(self.id)")
    }

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "소환사")
    static var defaultQuery = SummonerEntityQuery()
}

struct SummonerEntityQuery: EntityQuery, Sendable {
    func entities(for identifiers: [SummonerEntity.ID]) async throws -> [SummonerEntity] {
        let modelContext = ModelContext(Summoner.container)
        let summoners = try! modelContext.fetch(FetchDescriptor<Summoner>())
        return summoners.map { SummonerEntity(from: $0) }
    }

    func suggestedEntities() async throws -> [SummonerEntity] {
        let modelContext = ModelContext(Summoner.container)
        let summoners = try! modelContext.fetch(FetchDescriptor<Summoner>())
        return summoners.map { SummonerEntity(from: $0) }
    }
}
