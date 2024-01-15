//
//  ProfileView.swift
//  MyGithub
//
//  Created by kai on 1/15/24.
//

import SwiftUI

struct ProfileView: View {
    let nickname: String
    
    var body: some View {
        Text("Hello, World! \(nickname)!")
    }
}

#Preview {
    ProfileView(nickname: "devhaute")
}
