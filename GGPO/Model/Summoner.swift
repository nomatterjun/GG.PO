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
    let puuid: String
    var summonerLevel: Int

    init(accountID: String, profileIconID: Int, revisionDate: Int, name: String, id: String, puuid: String, summonerLevel: Int) {
        self.accountID = accountID
        self.profileIconID = profileIconID
        self.revisionDate = revisionDate
        self.name = name
        self.id = id
        self.puuid = puuid
        self.summonerLevel = summonerLevel
    }

    init(dto: SummonerDTO) {
        self.accountID = dto.accountID
        self.profileIconID = dto.profileIconID
        self.revisionDate = dto.revisionDate
        self.name = dto.name
        self.id = dto.id
        self.puuid = dto.puuid
        self.summonerLevel = dto.summonerLevel
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
