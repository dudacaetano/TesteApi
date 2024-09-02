//
//  HomeView.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 22/08/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView{
            
            TestView()
                 .tabItem {
                    Image(systemName: "line.3.horizontal.circle.fill")
                    Text("Feed")
                }
            TestView2()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Publicar")
                }
            TestView2()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Shop")
                }
            TestView2()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Perfil")
                }
            
        }
        .accentColor(.red)
        
       
    }
}

#Preview {
    HomeView()
}
