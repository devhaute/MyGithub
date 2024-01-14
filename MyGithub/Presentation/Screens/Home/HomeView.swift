//
//  HomeView.swift
//  MyGithub
//
//  Created by kai on 1/13/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
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
        }
        .padding(.horizontal, 30)
    }
}

extension HomeView {
    private var mainLogo: some View {
        Image(Constant.Image.mainLogo)
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 180)
    }
    
    private var textField: some View {
        TextField("닉네임을 입력해주세요", text: $viewModel.searchNickName)
            .textInputAutocapitalization(.none)
            .frame(maxWidth: .infinity)
            .padding(.trailing, 25)
            .padding(.bottom, 5)
            .containerUnderline()
            .overlay(
                HStack {
                    Spacer()
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color.black)
                        .offset(y: -2)
                }
                    .opacity(viewModel.searchNickName.isEmpty ? 0 : 1)
                    .animation(.bouncy, value: viewModel.searchNickName)
                    .onTapGesture {
                        viewModel.resetTextField()
                    }
            )
    }
    
    private var searchButton: some View {
        Button(action: {
            
        }, label: {
            Text("검색")
                .foregroundStyle(Color.white)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(5)
        })
    }
}

#Preview {
    HomeView()
}
