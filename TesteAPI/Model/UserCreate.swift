//
//  UserCreate.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 29/08/24.
//

import Foundation


extension User {
    struct Create: Encodable{
        let name: String
        let username: String
        let password: String
    }
}
