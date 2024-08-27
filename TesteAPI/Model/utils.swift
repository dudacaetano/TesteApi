//
//  utils.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 23/08/24.
//

import Foundation


struct User: Codable{
    
    let id : UUID
    let name: String
    let username: String
    let avatar: String?
}

struct Session: Decodable{
    let token: String
    let user: String
}

extension User{
    struct Create: Encodable{
        let name: String
        let username: String
        let password: String
    }
}

