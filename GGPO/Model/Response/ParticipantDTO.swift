//
//  ParticipantDTO.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

struct ParticipantDTO: Decodable, DataTransferObject {
    let individualPosition: String
    let lane: String
    let teamPosition: String
    let isWin: Bool
    let puuid: String

    enum CodingKeys: String, CodingKey {
        case individualPosition
        case lane
        case teamPosition
        case isWin = "win"
        case puuid
    }
}
