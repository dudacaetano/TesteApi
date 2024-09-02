//
//  UserPerfil.swift
//  NetworkingChallenge
//
//  Created by rafï teixeira de oliveira on 28/08/24.
//

import SwiftUI

struct UserInfo: View {
    var body: some View {
        HStack{
            Image(.image1)
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Group{
                VStack(alignment: .leading) {
                    VStack (alignment: .leading, spacing: 5) {
                        Text("Nome")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.vermelho)
                        Text("Pronomes")
                            .font(.body)
                        HStack{
                            Text("23")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Seguindo  |")
                            Text("66")
                                .font(.headline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("Seguidores")
                        }
                    }
                    
                    HStack (spacing: 5) {
                        FollowButton()
                        ChatButton()
                        LogoutButton()
                    }
                    
                }
                .padding([.leading], 5)
                .frame(maxWidth: 300)
            }
        }
        .padding(20)
    }
}

#Preview {
    UserInfo()
}
