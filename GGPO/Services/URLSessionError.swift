//
//  URLSessionError.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

enum URLSessionError: Error {
    case invalidURL
    case responseError(error: ErrorCode)
}

enum ErrorCode: Decodable {
    case badRequest
    case unAuthorized
    case forbidden
    case notFound
    case notAllowed
    case unsupportedMedia
    case limitExceeded
    case internalError
    case badGateway
    case unavailable
    case timeout

    public var code: Int {
        return switch self {
        case .badRequest: 400
        case .unAuthorized: 401
        case .forbidden: 403
        case .notFound: 404
        case .notAllowed: 405
        case .unsupportedMedia: 415
        case .limitExceeded: 429
        case .internalError: 500
        case .badGateway: 502
        case .unavailable: 503
        case .timeout: 504
        }
    }

    public var description: String {
        return switch self {
        case .badRequest: "Bad request"
        case .unAuthorized: "Unauthorized"
        case .forbidden: "Forbidden"
        case .notFound: "Data not found"
        case .notAllowed: "Method not allowed"
        case .unsupportedMedia: "Unsupported media type"
        case .limitExceeded: "Rate limit exceeded"
        case .internalError: "Internal server error"
        case .badGateway: "Bad gateway"
        case .unavailable: "Service unavailable"
        case .timeout: "Gateway timeout"
        }
    }
}
