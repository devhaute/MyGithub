//
//  HomeViewModel.swift
//  MyGithub
//
//  Created by kai on 1/14/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var searchNickName: String = ""
    var searchable: Bool {
        !searchNickName.isEmpty
    }
}

// MARK: - Public Functions

extension HomeViewModel {
    func resetTextField() {
        searchNickName = ""
    }
}
