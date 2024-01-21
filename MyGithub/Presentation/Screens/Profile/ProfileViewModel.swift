//
//  ProfileViewModel.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import Combine
import Factory

final class ProfileViewModel: BaseViewModel {
    @Injected(\.userService) private var service
    @Published var user: User = .emptyData
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
}

// MARK: - Public Functions

extension ProfileViewModel {
    func fetchUser(userId: String) {
        service.getUser(userId: userId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:()
                case .failure(let error):
                    self?.error = error
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &cancellables)
    }
}
