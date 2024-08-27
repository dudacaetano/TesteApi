//
//  SignupView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var viewModel = SignUpViewModel()
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
                
                VStack{
                    Image(systemName: "bicycle")
                        .resizable()
                        .frame(width: 120, height: 100)
                        .foregroundColor(.blue.opacity(0.8))
                    
                    Text("Sign Up")
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    CustomTextField(placeholder: "Username", text: $viewModel.username)
                        
                    CustomTextField(placeholder: "Name", text: $viewModel.name)
                    
                    CustomTextField(placeholder: "Password", text: $viewModel.password)
        
                    
                    CustomButtonLogin(title:"Sign Up"){
                        viewModel.signUp()
                        navigateToHome = true
                    }
                    .padding()
                    
                    /*if let message = viewModel.errorMessage {
                        Text(message)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    Spacer()*/
                }
                
                NavigationLink(destination: HomeView(), isActive: $navigateToHome){
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    SignupView()
}
