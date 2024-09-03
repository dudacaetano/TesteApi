//
//  UploadPostView.swift
//  TesteAPI
//
//  Created by Cintia Cassia Reis Braulino on 03/09/24.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedMedia: UIImage? = nil
    @State private var description: String = ""
    
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedItem,
                matching: .any(of: [.images, .videos]),
                photoLibrary: .shared()) {
                    Text("Selecione uma foto ou vídeo")
                        .foregroundColor(.blue)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        selectedMedia = nil
                        
                        guard let newItem = newItem else { return }
                        
                        if let data = try? await newItem.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                            selectedMedia = uiImage
                        }
                    }
                }
            
            if let selectedMedia = selectedMedia {
                Image(uiImage: selectedMedia)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding()
                
                Text(description.isEmpty ? "" : description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding([.leading, .trailing], 16)
            } else {
                Text("Nenhuma mídia selecionada")
                    .padding()
            }
            
            TextField("Insira uma descrição", text: $description)
                .padding(.horizontal, 16)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.bottom, 20)
            
            Button(action: uploadContent) {
                Text("Fazer upload")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
    
    private func uploadContent() {
        print("Foto ou vídeo enviado!")
        print("Descrição: \(description)")
    }
}


#Preview {
    UploadPostView()
}
