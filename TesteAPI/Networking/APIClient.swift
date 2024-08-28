//
//  APIClient.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//

import Foundation


// classes responsáveis por  gerenciar a comunicaçao com a API
//lida com as requisições  e respostas da API

/*
class APIClient{
    func send(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void){
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            guard let data = data else{
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "no data received"])
                completion(.failure(error))
                return
            }
            
            completion(.success(data))
            
        }
        
        task.resume()
    }
}
*/
