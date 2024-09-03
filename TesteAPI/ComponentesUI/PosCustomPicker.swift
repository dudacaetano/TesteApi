//
//  PosCustomPicker.swift
//  TesteAPI
//
//  Created by Cintia Cassia Reis Braulino on 03/09/24.
//

import Foundation

import SwiftUI

struct TikTokCustomPicker: View {
    @Binding var selectedCategory: Category
    var body: some View {
        HStack {
            Spacer()
            HStack {
                ForEach(Category.allCases, id: \.self) { category in
                    VStack {
                        Text(category.title)
                            .font(.headline)
                            .padding()
                            .underline(selectedCategory == category)
                            .tag(1)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation {
                                    selectedCategory = category
                                }
                            }
                    }
                }
            }
            .padding(.leading)
            Spacer()
        }
    }
}

#Preview {
    TikTokCustomPicker(selectedCategory: .constant(.following))
}
