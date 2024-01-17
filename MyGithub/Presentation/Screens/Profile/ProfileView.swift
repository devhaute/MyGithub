//
//  ProfileView.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import SwiftUI
import Factory

struct ProfileView: View {
    @InjectedObject(\.profileViewModel) private var viewModel
    let userId: String
    
    var body: some View {
        Text("Hello, World! \(viewModel.user?.id ?? "")!")
            .onAppear {
                viewModel.fetchUser(userId: userId)
            }
    }
}

#Preview {
    Container.shared.userService.register { StubUserService() }
    return ProfileView(userId: "devhaute")
}
