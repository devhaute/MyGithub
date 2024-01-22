//
//  AppError.swift
//  MyGithub
//
//  Created by kai on 1/22/24.
//

import Foundation

enum AppError: Error {
    case userNotFound
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .userNotFound:
            return "유저를 찾을 수 없습니다"
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case let .httpCode(code):
            return "Unexpected HTTP code: \(code)"
        case .unexpectedResponse:
            return "Unexpected response from the server"
        }
    }
}
