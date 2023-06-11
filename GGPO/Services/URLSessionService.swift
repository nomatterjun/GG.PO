//
//  URLSessionService.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

public class URLSessionService {
    typealias Service = URLSessionService

    static let platformBaseURL: String = "https://kr.api.riotgames.com"
    static let regionBaseURL: String = "https://asia.api.riotgames.com"

    /// 소환사 이름을 사용해 소환사에 대한 정보를 휙득합니다.
    func fetchSummoner(by summonerName: String) async throws -> Summoner {
        guard
            let baseURL = URL(string: Service.platformBaseURL),
            let url = URL(string: URLSessionPaths.summoners(summonerName: summonerName).path, relativeTo: baseURL)
        else { throw URLSessionError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let responseDTO = try JSONDecoder().decode(SummonerDTO.self, from: data)
            return Summoner(dto: responseDTO)
        } catch {
            let responseDTO = try JSONDecoder().decode(ErrorDTO.self, from: data)
            print(responseDTO)
            throw error
        }
    }

    /// 소환사의 PUUID를 사용해 최근 전적을 조회합니다.
    func fetchRecentMatches(by pUUID: String) async throws -> [String] {
        guard let baseURL = URL(string: Service.regionBaseURL) else {
            throw URLSessionError.invalidURL
        }
        let matchesPath = URLSessionPaths.matchesByPUUID(pUUID: pUUID).path
        let relativeURL = baseURL.appendingPathComponent(matchesPath)

        var urlComponents = URLComponents(url: relativeURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems?.append(URLQueryItem(name: "count", value: "50"))

        guard let url = urlComponents?.url else {
            throw URLSessionError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let matches = try JSONDecoder().decode([String].self, from: data)
        return matches
    }

    /// 게임 ID를 사용해 게임에 대한 자세한 정보를 조회합니다.
    func fetchMatch(_ matchID: String) async throws {
        guard
            let baseURL = URL(string: Service.regionBaseURL),
            let url = URL(string: URLSessionPaths.match(matchID: matchID).path, relativeTo: baseURL)
        else { throw URLSessionError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)
        let responseDTO = try JSONDecoder().decode(MatchDTO.self, from: data)
        print(responseDTO.info)
    }
}
