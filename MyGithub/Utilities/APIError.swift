//
//  APIError.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .httpCode(let code): return "Unexpected HTTP code: \(code)"
        case .unexpectedResponse: return "Unexpected response from the server"
        }
    }
}
