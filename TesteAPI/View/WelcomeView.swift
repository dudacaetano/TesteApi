//
//  WelcomeView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var navigateToHome = false
    
    var body: some View {
        
        NavigationStack{
            
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
                    
                    CustomButtonLogin(title: "Login"){
                        navigateToHome = true
                    }
                    NavigationLink(destination: loginView(), isActive: $navigateToHome){}
                    
                    
                    CustomButtonSignup(title: "Sign Up"){
                        navigateToHome = true
                    }
                    NavigationLink(destination: SignupView(), isActive: $navigateToHome){}
                }
                
            }
            .navigationBarHidden(true)
        }
       
    }
}

#Preview {
    WelcomeView()
}
