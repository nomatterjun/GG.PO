//
//  URLSessionService.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

public class URLSessionService {
    typealias Service = URLSessionService

    static let apiKey: String = "RGAPI-0446bcf6-9d81-4635-97fc-6f200666fc23"

    /// 소환사 이름을 사용해 소환사에 대한 정보를 휙득합니다.
    func fetchSummoner(by summonerName: String) async throws -> Summoner {
        let urlComponents = self.buildURLComponents(.platform,
                                                    path: .summoners(summonerName: summonerName),
                                                    queryItems: URLQueryItem(name: "api_key",
                                                                             value: URLSessionService.apiKey))

        guard let url = urlComponents.url else {
            throw URLSessionError.invalidURL
        }

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
        let urlComponents = self.buildURLComponents(.region,
                                                    path: .matchesByPUUID(pUUID: pUUID),
                                                    queryItems: URLQueryItem(name: "count", value: "50"),
                                                                URLQueryItem(name: "api_key", value: URLSessionService.apiKey))

        guard let url = urlComponents.url else {
            throw URLSessionError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let matches = try JSONDecoder().decode([String].self, from: data)
        return matches
    }

    /// 게임 ID를 사용해 게임에 대한 자세한 정보를 조회합니다.
    func fetchMatch(_ matchID: String) async throws {
        let urlComponents = self.buildURLComponents(.region,
                                                    path: .match(matchID: matchID),
                                                    queryItems: URLQueryItem(name: "api_key", value: URLSessionService.apiKey))

        guard let url = urlComponents.url else {
            throw URLSessionError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let responseDTO = try JSONDecoder().decode(MatchDTO.self, from: data)
        print(responseDTO.info)
    }
}

public enum URLRegion {
    case platform
    case region

    public var url: String {
        switch self {
        case .platform: "kr.api.riotgames.com"
        case .region: "asia.api.riotgames.com"
        }
    }
}

private extension URLSessionService {
    func buildURLComponents(_ region: URLRegion, path: URLSessionPaths, queryItems: URLQueryItem...) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = region.url
        components.path = path.path

        components.queryItems = queryItems

        return components
    }
}
