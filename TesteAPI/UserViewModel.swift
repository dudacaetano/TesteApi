//
//  UserViewModel.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 23/08/24.
//

import Foundation



/*final class UserViewModel: ObservableObject{
    
    @Published private var users = [User]()
    
    func fetchUsers() async {
        guard let url = URL(string "") else {
            print("This URL not working")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from:url)
            if let decodeResponse = try? JSONDecoder().decode([User].self, from: data){
                users = decodeResponse
            }
        } catch{
            print("These data are not valid")
        }
        
    }
}
 */
