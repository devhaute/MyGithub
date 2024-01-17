//
//  Shared.swift
//  MyGithub
//
//  Created by kai on 1/18/24.
//

import Foundation
import Factory

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
