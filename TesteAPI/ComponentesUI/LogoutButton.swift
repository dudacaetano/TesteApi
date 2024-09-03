//
//  ChatButton.swift
//  NetworkingChallenge
//
//  Created by rafï teixeira de oliveira on 28/08/24.
//

import SwiftUI

struct LogoutButton: View {
    
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action){
            Image(systemName: "rectangle.portrait.and.arrow.forward")
                .foregroundStyle(.symbols)
            
        }
        .controlSize(.small)
        .padding(10)
        .background(.button)
        .cornerRadius(7)
        
        
        /*Button(action: action){
           // acao
        } label: {
            Image(systemName: "rectangle.portrait.and.arrow.forward")
                .foregroundStyle(.symbols)
        }        
        //Button style here
        .controlSize(.small)
        .padding(10)
        .background(.button)
        .cornerRadius(7)*/
    }
}

#Preview {
    LogoutButton{
        print("Button tapped")
    }
}
