//
//  ProfileView.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import SwiftUI
import Factory
import NukeUI

struct ProfileView: View {
    @InjectedObject(\.profileViewModel) private var viewModel
    let userId: String
    
    var body: some View {
        BaseView(viewModel: viewModel) {
            VStack {
                avatar
                profile
                safariLink
            }
        }
        .onAppear {
            viewModel.fetchUser(userId: userId)
        }
    }
}

extension ProfileView {
    private var avatar: some View {
        let avatarBorderlineWidth: CGFloat = 4
        
        return (
            LazyImage(
                source: viewModel.user.avatarURL,
                resizingMode: .aspectFit
            )
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red, Color.yellow]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: avatarBorderlineWidth).padding(-(avatarBorderlineWidth / 2))
            )
            .frame(width: 280, height: 280)
        )
    }
    
    private var profile: some View {
        VStack {
            Text(viewModel.user.id)
                .font(.title)
            Text("🏠 \(viewModel.user.location ?? "")")
            Text(viewModel.user.bio ?? "")
            
            HStack {
                Text("Repos: \(viewModel.user.publicRepos)")
                Text("Followers: \(viewModel.user.followers)")
                Text("Following: \(viewModel.user.following)")
            }
            .padding(.top, 10)
        }
    }
    
    @ViewBuilder
    private var safariLink: some View {
        if let htmlURL = URL(string: viewModel.user.htmlURL) {
            Link(destination: htmlURL) {
                Text("웹페이지에서 보기")
                    .padding(.top, 50)
                    .font(.headline)
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    Container.shared.userService.register { StubUserService() }
    return ProfileView(userId: "devhaute")
}
