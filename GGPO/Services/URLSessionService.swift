//
//  URLSessionService.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

public class URLSessionService {
    typealias Service = URLSessionService

    static let platformBaseURL: String = "kr.api.riotgames.com"
    static let regionBaseURL: String = "asia.api.riotgames.com"

    func fetchRecentMatches(by pUUID: String) async throws -> [String] {
        let urlString: String = Service.regionBaseURL + MatchPaths.matchesByPUUID(pUUID: pUUID).path
        guard let url = URL(string: urlString) else { throw URLSessionError.invalidURL }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let responseDTO = try JSONDecoder().decode(MatchesDTO.self, from: data)
            return responseDTO.list
        } catch {
            throw error
        }
    }

    func fetchMatch(_ matchID: String) async throws {
        let urlString: String = Service.regionBaseURL + MatchPaths.match(matchID: matchID).path
        guard let url = URL(string: urlString) else { throw URLSessionError.invalidURL }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let responseDTO = try JSONDecoder().decode(MatchDTO.self, from: data)
            print(responseDTO.info)
        } catch {
            throw error
        }
    }
}
