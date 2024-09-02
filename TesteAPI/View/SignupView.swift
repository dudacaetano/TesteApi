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
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                
                LinearGradient(colors:[.black, .white], startPoint: . topLeading, endPoint: .bottomTrailing)
                
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
                    
                    TextField("Name", text: $name)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
        
                    NavigationLink(destination: HomeView(), isActive: $showingHomeView){
                        
                        CustomButtonLogin(title:"Sign Up"){
                            Task {
                                do {
                                    let token = try await API.registerUser(name: name, username: username, password: password)
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
    SignupView()
}
