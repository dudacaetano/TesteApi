//
//  AddButton.swift
//  NetworkingChallenge
//
//  Created by rafï teixeira de oliveira on 28/08/24.
//

import SwiftUI

struct FollowButton: View {
    var body: some View {
        Button{
            
        } label: {
            Image(systemName:"plus.circle")
                .foregroundStyle(.symbols)
            Text("Seguir")
                .fontWeight(.medium)
                .foregroundStyle(.symbols)
        }
        
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)

        
        //Button style here
        .padding(10)
        .background(.button)
        .cornerRadius(7)
        .controlSize(.small)                
    }
}

#Preview {
    FollowButton()
}
