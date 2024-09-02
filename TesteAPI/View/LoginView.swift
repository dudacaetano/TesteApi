//
//  loginView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct loginView: View {
    
//    @StateObject private var ViewModel = AuthViewModel()
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var showingHomeView = false
    
    var body: some View {
        NavigationView{
            ZStack {
                
                LinearGradient(colors:[.black, .white], startPoint: . topLeading, endPoint: .bottomTrailing)
                
             
              /*  Color.red
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.black)
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)   */
                
                VStack{
                    Image(systemName: "bicycle")
                        .resizable()
                        .frame(width: 120, height: 100)
                        .foregroundColor(.white)
                    
                    HStack{
                        Text("Flip")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .bold()
                            .italic()
                        Text("Flop")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .italic()                    }

                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 5) 
                            .stroke(Color.black))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black))
                        .cornerRadius(10)
                    
                    NavigationLink(destination: HomeView(), isActive: $showingHomeView){
                        
                        CustomButtonLogin(title: "Login"){
                            Task {
                                do {
                                    let token = try await API.login(username: username, password: password)
                                    print(token)
                                    
                                    showingHomeView = true
                                } catch {
                                    print(error)
                                }
                            }
                            
                        }
                        .padding()
                    }
                    
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
    
}

#Preview {
    loginView()
}
