//
//  SignupView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//


import SwiftUI

struct SignupView: View {
    
//    @StateObject private var viewModel = AuthViewModel()
    
    @State private var username = ""
    @State private var name = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var showingHomeView = false
    @State private var showingLoginViewUI = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading, spacing:10){
                    Text("FlipFlop/Cadastro")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding([.leading, .top], 5)
                        .padding(.bottom, 20)
                    
                    Text("Name")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding([.leading, .top], 5)
                        .padding(.top, 20)
                    
                    TextField("Name", text: $name)
                        .padding()
                        .frame(width: 345, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.boardbutton,
                                        lineWidth: 1)
                            
                        )
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    
                    Text("Username")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding([.leading, .top], 5)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 345, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.boardbutton, lineWidth: 1)
                        )
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Text("Password")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding([.leading, .top], 5)
                        .padding(.top, 20)
                    
                    SecureField("Mínimo de 8 dígitos", text: $password)
                        .fontWeight(.regular)
                        .padding()
                        .frame(width: 345, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.boardbutton, lineWidth: 1)
                        )
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Spacer()
                    
                    
                    
                    VStack{
                        
                        NavigationLink(destination: HomeView(), isActive: $showingHomeView){
                            
                            CustomButtonLogin(title:"Sign Up"){
                                Task {
                                    do {
                                        let token = try await API.registerUser(name: name, username: username, password: password)
                                        print(token)
                                        
                                        UserDefaults.standard.set(name, forKey: "userName")
                                        
                                        showingHomeView = true
                                    } catch {
                                        print(error)
                                    }
                                }
                            }
                        }
                        Text("Já sou membro da comunidade")
                            .font(.system(size: 13))
                            .fontWeight(.light)
                            .padding([.top], -20)
                        
                        NavigationLink(destination: LoginViewUI(), isActive: $showingLoginViewUI) {
                            
                            CustomButtonSignup(title: "Login"){
                                showingLoginViewUI = true
                            }
                        }

                    }
                }
            }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    

#Preview {
    SignupView()
}
