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

    @Parameter(title: "소환사")
    var summoner: SummonerEntity

    init(summoner: SummonerEntity) {
        self.summoner = summoner
    }

    init() { }
}

struct SummonerEntity: AppEntity, Identifiable, Hashable {
    var id: Summoner.ID
    var puuid: String
    var name: String

    init(id: Summoner.ID, puuid: String, name: String) {
        self.id = id
        self.puuid = puuid
        self.name = name
    }

    init(from summoner: Summoner) {
        self.id = summoner.id
        self.puuid = summoner.puuid
        self.name = summoner.name
    }

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(self.name)")
    }

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "소환사")
    static var defaultQuery = SummonerEntityQuery()

    static func == (lhs: SummonerEntity, rhs: SummonerEntity) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

struct SummonerEntityQuery: EntityQuery {
    func entities(for identifiers: [SummonerEntity.ID]) async throws -> [SummonerEntity] {
        logger.info("Loading summoners for identifiers: \(identifiers)")
        let modelContext = ModelContext(Summoner.container)
        let summoners = try! modelContext.fetch(FetchDescriptor<Summoner>())
        logger.info("Found \(summoners.count) summoners")
        return summoners.map { SummonerEntity(from: $0) }
    }

    func suggestedEntities() async throws -> [SummonerEntity] {
        logger.info("Loading summoners..")
        let modelContext = ModelContext(Summoner.container)
        let summoners = try! modelContext.fetch(FetchDescriptor<Summoner>())
        logger.info("Found \(summoners.count) summoners")

        let matches = try! modelContext.fetch(FetchDescriptor<Match>())
        logger.info("Found \(matches.count) matches")
        return summoners.map { SummonerEntity(from: $0) }
    }
}
