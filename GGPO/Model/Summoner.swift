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
    var accountID: String
    var profileIconID: Int
    var revisionDate: Int
    var name: String
    var id: String
    @Attribute(.unique) let puuid: String
    var summonerLevel: Int

    @Relationship(.cascade)
    var matches: [Match]

    init(accountID: String, profileIconID: Int, revisionDate: Int, name: String, id: String, puuid: String, summonerLevel: Int) {
        self.accountID = accountID
        self.profileIconID = profileIconID
        self.revisionDate = revisionDate
        self.name = name
        self.id = id
        self.puuid = puuid
        self.summonerLevel = summonerLevel
        self.matches = []
    }

    init(dto: SummonerDTO) {
        self.accountID = dto.accountID
        self.profileIconID = dto.profileIconID
        self.revisionDate = dto.revisionDate
        self.name = dto.name
        self.id = dto.id
        self.puuid = dto.puuid
        self.summonerLevel = dto.summonerLevel
        self.matches = []
    }

    func dto() -> SummonerDTO {
        SummonerDTO(
            accountID: self.accountID,
            profileIconID: self.profileIconID,
            revisionDate: self.revisionDate,
            name: self.name,
            id: self.id,
            puuid: self.puuid,
            summonerLevel: self.summonerLevel
        )
    }
}

extension Summoner: Identifiable {
    
}

extension Summoner: Hashable {
    static func == (lhs: Summoner, rhs: Summoner) -> Bool {
        lhs.puuid == rhs.puuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.puuid)
    }
}

extension Summoner {
    public static let container = try! ModelContainer(for: Summoner.self)
}

extension Summoner {
    typealias Random = RandomGenerator

    static func random() -> Summoner {
        let accountID = Random.randomString(length: 10)
        let profileIconID = Random.randomInt(from: 1, to: 100)
        let revisionDate = Random.randomInt(from: 1_000_000_000, to: 2_000_000_000)
        let name = Random.randomString(length: 10)
        let id = Random.randomString(length: 10)
        let puuid = Random.randomString(length: 10)
        let summonerLevel = Random.randomInt(from: 1, to: 100)

        let matches = [Match]() // Generate matches as needed

        let summoner = Summoner(accountID: accountID, profileIconID: profileIconID, revisionDate: revisionDate, name: name, id: id, puuid: puuid, summonerLevel: summonerLevel)
        summoner.matches = matches

        return summoner
    }
}
