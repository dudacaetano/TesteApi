//
//  ChatButton.swift
//  NetworkingChallenge
//
//  Created by rafï teixeira de oliveira on 28/08/24.
//

import SwiftUI

struct ChatButton: View {
    var body: some View {
        Button{
           // acao
        } label: {
            Image(systemName: "message")
                .foregroundStyle(.symbols)
            Text("Chat")
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
    ChatButton()
}
