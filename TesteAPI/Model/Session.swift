//
//  Session.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 29/08/24.
//

import Foundation

struct Session: Decodable{
    let token: String
    let user: User
}
