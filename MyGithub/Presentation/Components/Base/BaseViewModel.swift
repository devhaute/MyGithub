//
//  BaseViewModel.swift
//  MyGithub
//
//  Created by kai on 1/22/24.
//

import Foundation

enum ViewState {
    case initial
    case loading
    case failed(Error)
    case loaded
}

class BaseViewModel: ObservableObject {
    @Published var viewState: ViewState = .initial
}
