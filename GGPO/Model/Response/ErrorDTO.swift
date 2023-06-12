//
//  ErrorDTO.swift
//  GGPO
//
//  Created by 이창준 on 6/12/23.
//

import Foundation

struct ErrorDTO: Decodable {
    let status: StatusDTO
}

struct StatusDTO: Decodable {
    let message: String
    let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case message
        case statusCode = "status_code"
    }
}
