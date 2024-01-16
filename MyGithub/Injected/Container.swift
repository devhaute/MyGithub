//
//  Container.swift
//  MyGithub
//
//  Created by kai on 1/14/24.
//

import Foundation
import Factory

// MARK: - View Model Container
extension Container {
    var contentViewModel: Factory<HomeViewModel> {
        self { HomeViewModel() }
    }
    
    var profileViewModel: Factory<ProfileViewModel> {
        self { ProfileViewModel() }
    }
}

// MARK: - Service Container
extension Container {
    var userService: Factory<UserServiceProtocol> {
        self { UserService() }
    }
}

// MARK: - Repository Container
extension Container {
    var userRepository: Factory<UserRepositoryProtocol> {
        self { UserRepository(session: self.urlSession(), baseURL: AppEnvironment.baseURL) }
    }
}

// MARK: - URLSession
extension SharedContainer {
    var urlSession: Factory<URLSession> {
        self { self.configuredURLSession() }
            .singleton
    }
    
    private func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
}
