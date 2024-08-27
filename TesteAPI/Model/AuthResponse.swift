//
//  AuthResponse.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//

import Foundation

//resposta da API após uma tentiva de login

struct AuthResponse: Codable{
    let success: Bool
    let user: User?
    let message: String?
}
