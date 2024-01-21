//
//  HomeViewModel.swift
//  MyGithub
//
//  Created by kai on 1/14/24.
//

import Foundation

final class HomeViewModel: BaseViewModel {
    @Published var searchUserId: String = ""
    var searchable: Bool {
        !searchUserId.isEmpty
    }
}

// MARK: - Public Functions

extension HomeViewModel {
    func resetTextField() {
        searchUserId = ""
    }
}
