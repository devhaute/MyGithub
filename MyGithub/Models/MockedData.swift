//
//  MockedData.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import Foundation

extension User {
    static let mockedData: Self = .init(
        id: "devhaute",
        avatarURL: "https://avatars.githubusercontent.com/u/90536403?v=4",
        htmlURL: "https://github.com/devhaute",
        name: "Devhaute",
        location: "Korea, Seoul",
        bio: "🍎 Swift Developer (2021.9.12 ~ )",
        publicRepos: 25,
        publicGists: 1,
        followers: 11,
        following: 19
    )
}
