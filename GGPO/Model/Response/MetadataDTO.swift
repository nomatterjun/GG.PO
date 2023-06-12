//
//  MetadataDTO.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

struct MetadataDTO: Decodable, DataTransferObject {
    let dataVersion: String
    let matchID: String
    let participants: [String]

    enum CodingKeys: String, CodingKey {
        case dataVersion
        case matchID = "matchId"
        case participants
    }
}
