//
//  APIService.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//

import Foundation


//classe que faz as requisções HTTP 

enum API {
    
    static let baseURL = URL(string: "http://127.0.0.1:8080")!
    
    static func fetch(token: String) async throws -> User {
        let url = baseURL.appendingPathComponent("user/me")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer\(token)", forHTTPHeaderField: "Authorization")
        
        let(data, response) = try await URLSession.shared.data(for: request)
        
        try check(data: data, response: response)
        
        let user = try JSONDecoder().decode(User.self, from: data)
        
        return user
    }
    
    static func check(data: Data?, response: URLResponse) throws {
        if let response = response as? HTTPURLResponse {
            switch response.statusCode {
            case 200..<300:
                print("😸 Sucesso! \(response.statusCode)")
            default:
                print("🙀 Erro \(response.statusCode)")
                throw APIError.apiError(code: response.statusCode, body: data)
            }
        }
    }
    
    static func registerUser(name: String, username: String, password: String) async throws -> String {
        
        let create = User.Create(name: name, username: username, password: password)
        
        let url = baseURL.appending(path: "users") // http://127.0.0.1:8080/users
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(create)
        /*
        {
            "name":
            "username":
            "password":
        }
        */
        request.allHTTPHeaderFields = ["Content-Type": "application/json"
        ]
        
        let(data, response) = try await URLSession.shared.data(for: request)
        
        try check(data: data, response: response)
        
        let session = try JSONDecoder().decode(Session.self, from: data)
        
        return session.token
        
    }
    
    static func login(username: String, password: String) async throws -> String {
        let url = baseURL.appending(path: "users/login")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let auth = (username + ":" + password).data(using: .utf8)!.base64EncodedString()
        request.setValue("Basic \(auth)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let(data, response) = try await URLSession.shared.data(for:request)
        
        try check (data: data, response: response)
        
        let session = try JSONDecoder().decode(Session.self, from: data)
        
        return session.token
        
    }
    
    static func me(with token: String) async throws -> User {
        let url = baseURL.appending(path: "users/me")

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        try check(data: data, response: response)

        let user = try JSONDecoder().decode(User.self, from: data)
        return user
    }

    static func logout(with token: String) async throws {
        let url = baseURL.appending(path: "users/logout")

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        try check(data: data, response: response)

        let session = try JSONDecoder().decode(Session.self, from: data)

        print(session.token)
    }
    
    static func searchUsers() async throws -> [User] {
        let url = baseURL.appending(path: "users")
        let (data, response) = try await URLSession.shared.data(from: url)

        try check(data: data, response: response)
        // DECODE! Bytes -> [User]
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
    }
    
}
/*
class APIService {
    private let baseURL = "http://127.0.0.1:8080"
    
    private func fetch<T: Decodable>(_ url: URL, method: String, body: Data? = nil, completion: @escaping (Result<T,APIError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
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
} */



  
