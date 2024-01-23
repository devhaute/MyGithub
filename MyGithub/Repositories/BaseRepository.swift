//
//  BaseRepository.swift
//  MyGithub
//
//  Created by kai on 1/16/24.
//

import Foundation
import Combine
import OSLog

protocol BaseRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension BaseRepository {
    func call<Value>(endpoint: APIRequestProtocol) -> AnyPublisher<Value, Error>
    where Value: Decodable {
        do {
            let urlRequest = try endpoint.urlRequest(baseURL: baseURL)
            
            return session
                .dataTaskPublisher(for: urlRequest)
                .tryMap { (data, response) in
                    guard let code = (response as? HTTPURLResponse)?.statusCode else {
                        throw NetworkError.unexpectedResponse
                    }
                    guard HTTPCodes.success.contains(code) else {
                        throw NetworkError.httpCode(code)
                    }
                    return data
                }
                .decode(type: Value.self, decoder: JSONDecoder())
                .tryCatch { error -> AnyPublisher<Value, Error> in
                    logError(urlRequest, error)
                    throw error
                }
                .eraseToAnyPublisher()
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
    
    private func logError(_ request: URLRequest, _ error: Error) {
        Logger.networking.error(
            """
            🛑 [Error] [\(request.httpMethod  ?? "")] \
             \(request, privacy: .private)
             Error Type: \(error)
            """
        )
    }
}
