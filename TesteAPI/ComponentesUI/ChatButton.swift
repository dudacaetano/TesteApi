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
        
        //Button style here
        .controlSize(.small)
        .padding(10)
        .background(.button)
        .cornerRadius(7)
    }
}

#Preview {
    ChatButton()
}
