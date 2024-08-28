//
//  SignupView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var viewModel = AuthViewModel()
    
    @State private var username = ""
    @State private var name = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
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
                
                VStack{
                    Image(systemName: "bicycle")
                        .resizable()
                        .frame(width: 120, height: 100)
                        .foregroundColor(.blue.opacity(0.8))
                    
                    Text("Sign Up")
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    TextField("Name", text: $name)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
        
                    
                    CustomButtonLogin(title:"Sign Up"){
                        viewModel.register(name: name, username: username, password: password)
                    }
                    .padding()
                    
                    if let errorMessage = viewModel.errorMessage{
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
                
                
            }
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    SignupView()
}
