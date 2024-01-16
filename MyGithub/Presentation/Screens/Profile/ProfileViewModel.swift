//
//  ProfileViewModel.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import Combine
import Factory

final class ProfileViewModel: ObservableObject {
    @Injected(\.userService) private var service
    @Published var user: User?
    
    private var cancellables = Set<AnyCancellable>()
}

// MARK: - Public Functions

extension ProfileViewModel {
    func fetchUser(userId: String) {
        service.getUser(userId: userId)
            .sink { completion in
                switch completion {
                case .finished:()
                case .failure:()
//                    print("error! \(error)")
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &cancellables)
    }
}
