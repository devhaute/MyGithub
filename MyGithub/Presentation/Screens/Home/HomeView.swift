//
//  HomeView.swift
//  MyGithub
//
//  Created by kai on 1/13/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchNickName: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            mainLogo
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
            .padding(.bottom, 60)
    }
    
    private var textField: some View {
        TextField("닉네임을 입력해주세요", text: $searchNickName)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 5)
            .padding(.trailing, 25)
            .background(
                VStack {
                    Spacer()
                    Rectangle().frame(height: 1)
                }
            )
            .overlay(
                HStack {
                    Spacer()
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color.black)
                        .offset(y: -2)
                }
                    .opacity(searchNickName.isEmpty ? 0 : 1)
                    .animation(.bouncy, value: searchNickName)
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
