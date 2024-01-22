//
//  ErrorView.swift
//  MyGithub
//
//  Created by kai on 1/22/24.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    
    var body: some View {
        VStack {
            Text("An Error Occured")
                .font(.title)
            Text(error.localizedDescription)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40).padding()
        }
    }
}

#Preview {
    ErrorView(
        error: NSError(
            domain: "",
            code: 0,
            userInfo: [NSLocalizedDescriptionKey: "Something went wrong"]
        )
    )
}
