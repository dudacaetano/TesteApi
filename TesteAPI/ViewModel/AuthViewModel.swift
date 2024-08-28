//
//  AuthViewModel.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 27/08/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    private let apiService = APIService()
    
    @Published var user: User?
    @Published var token: String?
    @Published var errorMessage: String?
    
    func register(name: String, username: String, password: String) {
        apiService.registerUser(name: name, username: username, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.user = user
                    print("Successfully")
                case .failure(let error):
                    self.errorMessage = "Registration failed: \(error)"
                    print("Error: \(error) ")
                }
            }
        }
    }
    
    func login(username: String, password: String) {
        apiService.loginUser(username: username, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let authResponse):
                    self.token = authResponse.token
                    self.user = authResponse.user
                    print("Login succeful")
                case .failure(let error):
                    self.errorMessage = "Login failed: \(error)"
                    print("Error: \(error)")
                }
            }
        }
    }
}
