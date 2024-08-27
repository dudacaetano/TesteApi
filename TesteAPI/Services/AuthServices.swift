//
//  AuthServices.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//

import Foundation



// gerecia a autenticação, incluindo login e cadastro


struct SignUpCredentials {
    let username : String
    let name: String
    let password: String
}

class AuthServices{
    private let apiClient = APIClient()
    
    func signUp(with credentials: SignUpCredentials, completion: @escaping(Result<User, Error>) -> Void){
        let url = URL(string: "http://127.0.0.1:8080")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "username": credentials.username,
            "name": credentials.name,
            "password": credentials.password
        
        ]
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options:[])
        } catch {
            completion(.failure(error))
            return
        }
        
        apiClient.send(request) { result in
            switch result {
            case .success(let data):
                do{
                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                    if let user = authResponse.user, authResponse.success {
                        completion(.success(user))
                    } else{
                        let error = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: authResponse.message ?? "Unknow error"])
                        completion(.failure(error))
                    }
                    
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
                
                
            }
        }
    }
}
