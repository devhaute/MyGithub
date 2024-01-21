//
//  BaseView.swift
//  MyGithub
//
//  Created by kai on 1/22/24.
//

import SwiftUI

struct BaseView<LoadedView>: View
where LoadedView: View {
    @ObservedObject private var viewModel: BaseViewModel
    private let loadedView: () -> LoadedView
    
    init(viewModel: BaseViewModel, _ loadedView: @escaping () -> LoadedView) {
        self.viewModel = viewModel
        self.loadedView = loadedView
    }
    
    var body: some View {
        switch viewModel.viewState {
        case .initial:
            ProgressView()
        case .loading:
            ProgressView()
        case .loaded:
            loadedView()
        case .failed(let error):
            ErrorView(error: error) {
                // TODO: -> Retry 구현
            }
        }
    }
}
