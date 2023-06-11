//
//  Summoner.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation
import SwiftData

@Model
final class Summoner {
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
}
