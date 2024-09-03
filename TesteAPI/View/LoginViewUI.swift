//
//  loginView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct LoginViewUI: View {
    
    //    @StateObject private var ViewModel = AuthViewModel()
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var showingHomeView = false
    @State private var showingSignupView = false
    
    var body: some View {
            ZStack {
                    VStack(alignment: .leading, spacing: 10){
                        Text("FlipFlop/Login")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .padding([.leading, .top], 5)
                            .padding(.bottom, 20)
                        
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
                        
                        Text("Senha")
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
                            
                            Button {
                                Task {
                                    do {
                                        let token = try await API.login(username: username, password: password)
                                        
                                        //buscar o nome do user apos o login
                                        let user = try await API.me(with:token)
                                        
                                        //salvar o nome no userDefaults
                                        UserDefaults.standard.set(user.name, forKey:"userName")
                                        
                                        //salvar o token no userDefaults
                                        UserDefaults.standard.set(token, forKey: "userToken")
                                        
                                        print(token)
                                        
                                        showingHomeView = true
                                    } catch {
                                        print(error)
                                    }
                                }
                            } label: {
                                Text("Login")
                                    .foregroundColor(.textboard)
                                    .frame(width: 345, height: 46)
                                    .background(Color.boardbutton)
                                    .cornerRadius(4)
                                    .padding(.bottom, 20)
                            }
                            .navigationDestination(isPresented: $showingHomeView) {
                                HomeView()
                            }
                            
                            Text("Não é membro da comunidade?")
                                .font(.system(size: 13))
                                .fontWeight(.light)
                                .padding([.top], -20)
                            
                            NavigationLink(destination: SignupView(), isActive: $showingSignupView) {
                                
                                CustomButtonSignup(title: "Cadastre-se"){
                                    showingSignupView = true
                                }
                            }
                        }
                        .padding(.bottom, 20)
                    }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct RegistrationView: View {
    var body: some View {
        Text("Tela de Cadastro")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    LoginViewUI()
}
