//
//  HomeView.swift
//  MyGithub
//
//  Created by kai on 1/13/24.
//

import SwiftUI
import Factory

struct HomeView: View {
    @InjectedObject(\.contentViewModel) private var viewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                mainLogo
                    .padding(.bottom, 60)
                textField
                searchButton
                    .padding(.top, 10)
                
                Spacer()
                Spacer()
                
                Text("Created by Chanho Lee")
                    .font(.caption)
            }
            .padding(.horizontal, 30)
        }
    }
}

extension HomeView {
    private var mainLogo: some View {
        Image.App.mainLogo
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 180)
    }
    
    private var textField: some View {
        TextField("닉네임을 입력해주세요", text: $viewModel.searchUserId)
            .textInputAutocapitalization(.none)
            .frame(maxWidth: .infinity)
            .padding(.trailing, 25)
            .padding(.bottom, 5)
            .containerUnderline()
            .overlay(
                HStack {
                    Spacer()
                    Image.App.xMark
                        .foregroundColor(Color.black)
                        .offset(y: -2)
                }
                    .opacity(viewModel.searchUserId.isEmpty ? 0 : 1)
                    .animation(.bouncy, value: viewModel.searchUserId)
                    .onTapGesture {
                        viewModel.resetTextField()
                    }
            )
    }
    
    private var searchButton: some View {
        NavigationLink {
            ProfileView(userId: viewModel.searchUserId)
        } label: {
            Text("검색")
                .foregroundStyle(Color.white)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(5)
                .opacity(viewModel.searchable ? 1 : 0.4)
        }.disabled(!viewModel.searchable)
    }
}

#Preview {
    HomeView()
}
