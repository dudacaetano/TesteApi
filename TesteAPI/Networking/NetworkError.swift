//
//  NetworkError.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//

import Foundation


// possiveis erros de rede 

enum NetworkError: Error{
    
    case invalidURL
    case noData
    case decodingError
    case serverError(String)
    
}
