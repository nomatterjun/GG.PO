//
//  InfoDTO.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

struct InfoDTO: Decodable {
    /// Unix timestamp for when the game is created on the game server (i.e., the loading screen).
    let gameCreation: Int
    /// This field returns the game length in milliseconds calculated from gameEndTimestamp - gameStartTimestamp.
    let gameDuration :Int
    /// Unix timestamp for when match ends on the game server.
    let gameEndTimestamp: Int
    let gameID: Int
    /// Refer to the Game Constants documentation.
    let gameMode: String
    let gameName: String
    /// Unix timestamp for when match starts on the game server.
    let gameStartTimestamp: Int
    let gameType: String
    /// The first two parts can be used to determine the patch a game was played on.
    let gameVersion: String
    /// Refer to the Game Constants documentation.
    let mapID: Int
    let participants: [ParticipantDTO]
    /// Platform where the match was played.
    let platformID: String
    /// Refer to the Game Constants documentation.
    let queueID: Int
//    let teams: [TeamDTO]
    /// Tournament code used to generate the match.
    let tournamentCode: String

    enum CodingKeys: String, CodingKey {
        case gameCreation, gameDuration, gameEndTimestamp
        case gameID = "gameId"
        case gameMode, gameName, gameStartTimestamp, gameType, gameVersion
        case mapID = "mapId"
        case participants
        case platformID = "platformId"
        case queueID = "queueId"
        case tournamentCode
    }
}
