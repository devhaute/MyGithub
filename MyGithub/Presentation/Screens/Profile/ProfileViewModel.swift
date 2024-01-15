//
//  ProfileViewModel.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published var user: User = .mockedData
}
