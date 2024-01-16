//
//  BaseRepository.swift
//  MyGithub
//
//  Created by kai on 1/16/24.
//

import Foundation
import Combine

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
                        throw APIError.unexpectedResponse
                    }
                    guard HTTPCodes.success.contains(code) else {
                        throw APIError.httpCode(code)
                    }
                    return data
                }
                .decode(type: Value.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
}
