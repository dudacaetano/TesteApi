//
//  APIService.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//

import Foundation


//classe que faz as requisções HTTP 



import Foundation

class APIService {
    private let baseURL = "http://127.0.0.1:8080"
    
    private func fetch<T: Decodable>(_ url: URL, method: String, body: Data? = nil, completion: @escaping (Result<T,APIError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.requestFailed))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
    
    func registerUser(name: String, username: String, password: String, completion: @escaping (Result<User, APIError>) -> Void) {
        guard let url = URL(string: "\(baseURL)/users") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let userData = ["name": name, "username": username, "password": password]
        
        do {
            let body = try JSONEncoder().encode(userData)
            fetch(url, method: "POST", body: body, completion: completion)
        } catch {
            completion(.failure(.requestFailed))
        }
    }
    
    func loginUser(username: String, password: String, completion: @escaping (Result<AuthResponse, APIError>) -> Void) {
        guard let url = URL(string: "\(baseURL)/users/login") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let loginData = ["username": username, "password": password]
        
        do {
            let body = try JSONEncoder().encode(loginData)
            fetch(url, method: "POST", body: body, completion: completion)
        } catch {
            completion(.failure(.requestFailed))
        }
    }
}
