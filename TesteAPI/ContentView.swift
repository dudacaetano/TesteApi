//
//  ContentView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SignupView()) {
                    Text("Go to Register")
                }
                .padding()

                NavigationLink(destination: loginView()) {
                    Text("Go to Login")
                }
                .padding()
            }
            
        }
    }
}



#Preview {
    ContentView()
}
