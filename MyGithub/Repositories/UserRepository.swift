//
//  UserRepository.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import Foundation
import Combine

protocol UserRepositoryProtocol: BaseRepository {
    func getUser(userId: String) -> AnyPublisher<User, Error>
}

struct UserRepository: UserRepositoryProtocol {
    let session: URLSession
    let baseURL: String
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func getUser(userId: String) -> AnyPublisher<User, Error> {
        return call(endpoint: EndPoints.getUser(userId))
    }
}

extension UserRepository {
    enum EndPoints {
        case getUser(String)
    }
}

extension UserRepository.EndPoints: APIRequestProtocol {
    var path: String {
        switch self {
        case .getUser(let userId):
            return "/users/\(userId)"
        }
    }
    
    var method: String {
        switch self {
        case .getUser:
            return "GET"
        }
    }
    
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    
    func body() throws -> Data? {
        return nil
    }
}
