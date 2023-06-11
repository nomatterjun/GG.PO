//
//  URLSessionPaths.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

enum URLSessionPaths {
    case summoners(summonerName: String)
    case matchesByPUUID(pUUID: String)
    case match(matchID: String)

    public var path: String {
        return switch self {
        case let .summoners(name):
            "/lol/summoner/v4/summoners/by-name/\(name)"
        case let .matchesByPUUID(pUUID):
            "/lol/match/v5/matches/by-puuid/\(pUUID)/ids"
        case let .match(matchID):
            "/lol/match/v5/matches/\(matchID)"
        }
    }
}
