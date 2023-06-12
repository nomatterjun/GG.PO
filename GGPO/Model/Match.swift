//
//  Match.swift
//  GGPO
//
//  Created by 이창준 on 6/12/23.
//

import Foundation
import SwiftData

@Model
final class Match {
    let id = UUID()
    /// Unix timestamp for when the game is created on the game server (i.e., the loading screen).
    var gameCreation: Int
    /// This field returns the game length in milliseconds calculated from gameEndTimestamp - gameStartTimestamp.
    var gameDuration :Int
    /// Unix timestamp for when match ends on the game server.
    var gameEndTimestamp: Int
    @Attribute(.unique) var gameID: Int
    /// Refer to the Game Constants documentation.
    var gameMode: String
    var gameName: String
    /// Unix timestamp for when match starts on the game server.
    var gameStartTimestamp: Int
    var gameType: String
    /// The first two parts can be used to determine the patch a game was played on.
    var gameVersion: String
    /// Refer to the Game Constants documentation.
    var mapID: Int
    var participants: [Participant]
    /// Platform where the match was played.
    var platformID: String
    /// Refer to the Game Constants documentation.
    var queueID: Int
    //    let teams: [TeamDTO]
    /// Tournament code used to generate the match.
    var tournamentCode: String

    init(gameCreation: Int, gameDuration: Int, gameEndTimestamp: Int, gameID: Int, gameMode: String, gameName: String, gameStartTimestamp: Int, gameType: String, gameVersion: String, mapID: Int, participants: [Participant], platformID: String, queueID: Int, tournamentCode: String) {
        self.gameCreation = gameCreation
        self.gameDuration = gameDuration
        self.gameEndTimestamp = gameEndTimestamp
        self.gameID = gameID
        self.gameMode = gameMode
        self.gameName = gameName
        self.gameStartTimestamp = gameStartTimestamp
        self.gameType = gameType
        self.gameVersion = gameVersion
        self.mapID = mapID
        self.participants = participants
        self.platformID = platformID
        self.queueID = queueID
        self.tournamentCode = tournamentCode
    }

    @Transient
    var date: Date {
        return Date(timeIntervalSince1970: TimeInterval(self.gameStartTimestamp / 1000))
    }

    @Transient
    var isWin: Bool {
        return self.participants.first!.isWin
    }

    func participant(for puuid: String) -> Participant {
        return self.participants.first(where: { $0.puuid == puuid })!
    }

    init(dto: MatchDTO) {
        self.gameCreation = dto.info.gameCreation
        self.gameDuration = dto.info.gameDuration
        self.gameEndTimestamp = dto.info.gameEndTimestamp
        self.gameID = dto.info.gameID
        self.gameMode = dto.info.gameMode
        self.gameName = dto.info.gameName
        self.gameStartTimestamp = dto.info.gameStartTimestamp
        self.gameType = dto.info.gameType
        self.gameVersion = dto.info.gameVersion
        self.mapID = dto.info.mapID
        self.participants = dto.info.participants.map { Participant(dto: $0) }
        self.platformID = dto.info.platformID
        self.queueID = dto.info.queueID
        self.tournamentCode = dto.info.tournamentCode
    }
}

extension Match: Identifiable { }

extension Match: Hashable {
    static func == (lhs: Match, rhs: Match) -> Bool {
        lhs.gameID == rhs.gameID &&
        lhs.gameStartTimestamp == rhs.gameStartTimestamp
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.gameID)
        hasher.combine(self.gameStartTimestamp)
    }
}

extension Match {
    typealias Random = RandomGenerator

    static func random() -> Match {
        let gameCreation = Random.randomInt(from: 1_000_000_000, to: 2_000_000_000)
        let gameDuration = Random.randomInt(from: 1, to: 3600)
        let gameEndTimestamp = gameCreation + gameDuration
        let gameID = Random.randomInt(from: 1, to: 1000)
        let gameMode = Random.randomString(length: 10)
        let gameName = Random.randomString(length: 10)
        let gameStartTimestamp = gameCreation
        let gameType = Random.randomString(length: 10)
        let gameVersion = Random.randomString(length: 5)
        let mapID = Random.randomInt(from: 1, to: 10)
        let participants = [Participant]() // Generate participants as needed
        let platformID = Random.randomString(length: 5)
        let queueID = Random.randomInt(from: 1, to: 100)
        let tournamentCode = Random.randomString(length: 10)

        return Match(gameCreation: gameCreation, gameDuration: gameDuration, gameEndTimestamp: gameEndTimestamp, gameID: gameID, gameMode: gameMode, gameName: gameName, gameStartTimestamp: gameStartTimestamp, gameType: gameType, gameVersion: gameVersion, mapID: mapID, participants: participants, platformID: platformID, queueID: queueID, tournamentCode: tournamentCode)
    }
}
