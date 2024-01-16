//
//  UserService.swift
//  MyGithub
//
//  Created by kai on 1/16/24.
//

import Foundation
import Combine
import Factory

protocol UserServiceProtocol {
    func getUser(userId: String) -> AnyPublisher<User, Error>
}

final class UserService: UserServiceProtocol {
    @Injected(\.userRepository) private var userRepository
    
    func getUser(userId: String) -> AnyPublisher<User, Error> {
        userRepository.getUser(userId: userId)
        // TODO: - OSLog 적용하기
        // Catch Publisher 추가
    }
}
