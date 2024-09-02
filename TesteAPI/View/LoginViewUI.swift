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
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack {
                    VStack(alignment: .leading, spacing: 10){
                        Text("TEU LOGIN")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .padding([.leading, .top], 5)
                            .padding(.bottom, 20)
                        
                        Text("Username")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .padding([.leading, .top], 5)
                        
                        TextField("", text: $username)
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
                            
                            Button("Login"){
                                Task {
                                    do {
                                        let token = try await API.login(username: username, password: password)
                                        print(token)
                                    } catch {
                                        print(error)
                                    }
                                }
                            }
                            .foregroundColor(.textboard)
                            .frame(width: 345, height: 46)
                            .background(Color.boardbutton)
                            .cornerRadius(4)
                            .padding(.bottom, 20) // Ajuste conforme necessário
                            
                            //                    if let errorMessage = ViewModel.errorMessage{
                            //                        Text(errorMessage)
                            //                            .foregroundColor(.red)
                            //                    }
                            
                            Text("Não é membro da comunidade?")
                                .font(.system(size: 13))
                                .fontWeight(.light)
                                .padding([.top], -20)
                            
                            NavigationLink(destination: RegistrationView()) {
                                Text("Cadastro")
                                    .foregroundStyle(Color.labeltext)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding([.top], -10)
                            }
                        }
                        .padding(.bottom, 20)
                    }
            }
            .navigationBarHidden(true)
        }
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
