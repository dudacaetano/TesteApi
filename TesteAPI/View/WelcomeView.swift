//
//  WelcomeView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var showingLoginView = false
    @State private var showingSignupView = false
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                LinearGradient(colors:[.black, .white], startPoint: . topLeading, endPoint: .bottomTrailing)
                
                VStack {
                    Image(systemName: "bicycle")
                        .resizable()
                        .frame(width: 120, height: 100)
                        .foregroundColor(.white.opacity(0.8))
                        
                    
                    Text("Fique nas Áreas")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size:18))
                        .multilineTextAlignment(.leading)
                    
                    
                    Text("Nosso aplicativo quer juntar a comunidade local de fixas e single speed de Fortaleza, voce permitindo que tenhamos acesso a sua localização, garante que voce tenha uma experiência completa")
                        .multilineTextAlignment(.center)
                        .padding()
                        
                    
                    
                    NavigationLink(destination: loginView(), isActive: $showingLoginView){
                        CustomButtonLogin(title: "Login"){
                            showingLoginView = true
                        }
                        
                        
                        
                    }
                    
                    
                    
                    NavigationLink(destination: SignupView(), isActive: $showingSignupView){
                        CustomButtonSignup(title: "Sign Up"){
                            showingSignupView = true
                        }
                        
                    }
                }
                .padding()
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
       
    }
}

#Preview {
    WelcomeView()
}
