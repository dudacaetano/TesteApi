//
//  loginView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct loginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack {
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
                    
                    Text("Login")
                        .font(.title3)
                        .bold()
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Button("Login"){
                        //Authenticate user
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    func authenticateUser(username: String, password:String){
        if username.lowercased() == "mario2021"{
            wrongUsername = 0
            
            if password.lowercased() == "abc123" {
                wrongPassword = 0
                showingLoginScreen = true
            }else {
                wrongPassword = 2
            }
        }
        else {
            wrongUsername = 2
        }
    }
}

#Preview {
    loginView()
}
