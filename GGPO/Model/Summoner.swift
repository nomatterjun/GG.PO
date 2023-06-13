//
//  Summoner.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation
import SwiftData

@Model
final class Summoner: Storable {
    let id = UUID()
    var accountID: String
    var profileIconID: Int
    var revisionDate: Int
    var name: String
    var summonerID: String
    @Attribute(.unique) let puuid: String
    var summonerLevel: Int
    
    var matches: [Match] = []

    init(accountID: String, profileIconID: Int, revisionDate: Int, name: String, summonerID: String, puuid: String, summonerLevel: Int) {
        self.accountID = accountID
        self.profileIconID = profileIconID
        self.revisionDate = revisionDate
        self.name = name
        self.summonerID = summonerID
        self.puuid = puuid
        self.summonerLevel = summonerLevel
    }

    init(dto: SummonerDTO) {
        self.accountID = dto.accountID
        self.profileIconID = dto.profileIconID
        self.revisionDate = dto.revisionDate
        self.name = dto.name
        self.summonerID = dto.summonerID
        self.puuid = dto.puuid
        self.summonerLevel = dto.summonerLevel
    }

    func dto() -> SummonerDTO {
        SummonerDTO(
            accountID: self.accountID,
            profileIconID: self.profileIconID,
            revisionDate: self.revisionDate,
            name: self.name,
            summonerID: self.summonerID,
            puuid: self.puuid,
            summonerLevel: self.summonerLevel
        )
    }
}

extension Summoner: Identifiable { }

extension Summoner: Hashable {
    static func == (lhs: Summoner, rhs: Summoner) -> Bool {
        lhs.puuid == rhs.puuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.puuid)
    }
}

extension Summoner {
    public static let container = try! ModelContainer(for: schema, configurations: [
        .init(inMemory: false),
        .init(sharedAppContainerIdentifier: "group.letusgo-hack.GGPO")])

    static let schema = Schema([
        Summoner.self,
        Match.self
    ])

    public static func instance(with modelContext: ModelContext) -> Summoner {
        if let result = try! modelContext.fetch(FetchDescriptor<Summoner>()).first {
            return result
        } else {
            return Summoner.random()
        }
    }

    public static func generateData(modelContext: ModelContext) {
        let _ = instance(with: modelContext)
    }
}

extension Summoner {
    typealias Random = RandomGenerator

    static func random() -> Summoner {
        let accountID = Random.randomString(length: 10)
        let profileIconID = Random.randomInt(from: 1, to: 100)
        let revisionDate = Random.randomInt(from: 1_000_000_000, to: 2_000_000_000)
        let name = Random.randomString(length: 10)
        let summonerID = Random.randomString(length: 10)
        let puuid = Random.randomString(length: 10)
        let summonerLevel = Random.randomInt(from: 1, to: 100)

        let matches = [Match]() // Generate matches as needed

        let summoner = Summoner(accountID: accountID, profileIconID: profileIconID, revisionDate: revisionDate, name: name, summonerID: summonerID, puuid: puuid, summonerLevel: summonerLevel)
        summoner.matches = matches

        return summoner
    }
}
