//
//  MatchesDTO.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

struct MatchesDTO: Decodable {
    let list: [String]

    enum CodingKeys: String, CodingKey {
        case list
    }
}
