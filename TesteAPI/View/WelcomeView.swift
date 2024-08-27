//
//  WelcomeView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        ZStack{
            Color.blue
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            
            VStack {
                Image(systemName: "bicycle")
                    .resizable()
                    .frame(width: 120, height: 100)
                    .foregroundColor(.blue.opacity(0.8))
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation")
                    .multilineTextAlignment(.center)
                    .padding()
                     
                
                Button("Login"){
                    //Authenticate user
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                Button("Sign Up "){
                    //Authenticate user
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
            }
            
            
            
        }
        .navigationBarHidden(true)
       
    }
}

#Preview {
    WelcomeView()
}
