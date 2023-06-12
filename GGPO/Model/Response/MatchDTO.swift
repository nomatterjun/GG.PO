//
//  MatchDTO.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

struct MatchDTO: Decodable, DataTransferObject {
    let metadata: MetadataDTO
    let info: InfoDTO

    enum CodingKeys: String, CodingKey {
        case metadata
        case info
    }
}
