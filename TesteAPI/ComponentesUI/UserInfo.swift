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
                Circle()
                    .frame(width: 100)
                    .padding([.bottom], 18)
                    .foregroundColor(.cinzaClaro)
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
                                Text("Seguindo  |")
                                Text("66")
                                    .font(.headline)
                                Text("Seguidores")
                            }
                        }
                        
                        HStack (spacing: 21) {
                            FollowButton()
                            ChatButton()
                        }
                    
                    }
                }
                
            }
    }
}

#Preview {
    UserInfo()
}
