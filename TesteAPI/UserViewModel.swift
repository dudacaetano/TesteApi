//
//  UserViewModel.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 23/08/24.
//
import Foundation

final class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    func fetchUsers() async {
        let usersUrlString = "http://127.0.0.1:8080/users"
        
        if let url = URL(string: usersUrlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                // Handle returning data in the Main thread
                DispatchQueue.main.async {
                    if let error = error {
                        // Handle error
                        print("Error fetching users: \(error.localizedDescription)")
                    } else {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase // Handle properties that look like first_name > firstName
                        
                        if let data = data,
                           let users = try? decoder.decode([User].self, from: data) {
                            // Setting the data
                            self.users = users
                        } else {
                            // Handle error
                            print("Failed to decode users")
                        }
                    }
                }
            }.resume()
        } else {
            // Handle error
            print("Invalid URL")
        }
    }
}

 
