//
//  Container.swift
//  MyGithub
//
//  Created by kai on 1/14/24.
//

import Foundation
import Factory

extension Container {
    var contentViewModel: Factory<HomeViewModel> {
        self { HomeViewModel() }
    }
}
