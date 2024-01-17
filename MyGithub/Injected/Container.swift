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
