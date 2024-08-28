//
//  APIError.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 27/08/24.
//


import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}
