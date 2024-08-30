//
//  Feed.swift
//  NetworkingChallenge
//
//  Created by rafï teixeira de oliveira on 28/08/24.
//

import SwiftUI

struct FeedGrid: View {
    var body: some View {
        ScrollView {
            
            let spacing: CGFloat = 0
            
            let columns = Array(repeating: GridItem(.flexible(), spacing: spacing), count: 3)
            
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(1..<50) { item in
                    NavigationLink {
                        PostView()
                    } label: {
                        Image("image1")
                            .resizable() // redimensionar imagem
                            .scaledToFill() // escalonar para preencher
                            .frame(width:112, height: 150)
                            .clipped() // clipar
                            .aspectRatio(0, contentMode: .fit)
                    }
                }
            }
        }
        .cornerRadius(20)
        .padding(30)
    }
}

#Preview {
    NavigationStack {
        FeedGrid()
    }
}
