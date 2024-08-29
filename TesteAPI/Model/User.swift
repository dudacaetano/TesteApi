//
//  User.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 28/08/24.
//

import Foundation

struct User: Codable{
    let id : UUID?
    let name: String
    let username: String
    let avatar: String?
}
