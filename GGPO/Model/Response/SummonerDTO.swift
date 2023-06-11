//
//  SummonerDTO.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

struct SummonerDTO: Decodable, DataTransferObject {
    let accountID: String
    let profileIconID: Int
    let revisionDate: Int
    let name: String
    let id: String
    let puuid: String
    let summonerLevel: Int

    enum CodingKeys: String, CodingKey {
        case accountID = "accountId"
        case profileIconID = "profileIconId"
        case revisionDate, name, id, puuid, summonerLevel
    }
}
