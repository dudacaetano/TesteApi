//
//  SignUpViewModel.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//



//lógica de autenticação e chamadas para o serviço de login e cadastro

import Foundation
import Combine


 class SignUpViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?

    //private let authService = AuthService()

    func signUp() {
        
    }
}


