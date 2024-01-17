//
//  UserService.swift
//  MyGithub
//
//  Created by kai on 1/16/24.
//

import Foundation
import Combine
import Factory

// TODO: - 데이터 지속성, 캐싱을 위한 Core Data OR SwiftData 연동 작업 진행하기

protocol UserServiceProtocol {
    func getUser(userId: String) -> AnyPublisher<User, Error>
}

struct UserService: UserServiceProtocol {
    @Injected(\.userRepository) private var userRepository
    
    func getUser(userId: String) -> AnyPublisher<User, Error> {
        userRepository.getUser(userId: userId)
    }
}

struct StubUserService: UserServiceProtocol {
    func getUser(userId: String) -> AnyPublisher<User, Error> {
        let subject = CurrentValueSubject<User, Error>(.mockedData)
        return subject.eraseToAnyPublisher()
    }
}
