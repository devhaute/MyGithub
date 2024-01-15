//
//  View+Extension.swift
//  MyGithub
//
//  Created by kai on 1/14/24.
//

import SwiftUI

extension View {
    func containerUnderline() -> some View {
        self.background(
            VStack {
                Spacer()
                Rectangle().frame(height: 1)
            }
        )
    }
}
