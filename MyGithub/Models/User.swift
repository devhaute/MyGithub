//
//  User.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import Foundation

// MARK: - User
struct User: Decodable {
    let id: String
    let htmlURL: String
    let avatarURL, name, location, bio: String?
    let publicRepos, publicGists, followers, following: Int

    enum CodingKeys: String, CodingKey {
        case id = "login"
        case htmlURL = "html_url"
        case avatarURL = "avatar_url"
        case name, location, bio
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
    }
}
