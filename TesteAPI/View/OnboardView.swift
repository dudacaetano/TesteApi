//
//  OnboardView.swift
//  TesteAPI
//
//  Created by rafï teixeira de oliveira on 01/09/24.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                Image( systemName: "location.circle")
                    .resizable()            // Permite redimensionar o ícone
                    .aspectRatio(contentMode: .fit)  // Mantém a proporção
                    .frame(width: 43, height: 43)  // Define o tamanho do ícone
                    .foregroundColor(.vermelho)  // Define a cor do ícone
                    .padding(.leading, 5)
                    .padding(.bottom,5)
                
                Text("FIQUE NAS ÁREAS")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding([.leading, .top], 5)
                
                Text("Nosso aplicativo quer juntar a comunidade local de\nfixas e single speed de Fortaleza, você permitindo que tenhamos acesso a sua localização, garante que você tenha uma experiência completa")
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 80, trailing: 5))
                // Adicione mais conteúdo de onboarding aqui
            }
            
            VStack {
                Spacer()
                
                AllowButton()
                    .frame(width: 345, height: 46)
                    .padding(.bottom, 66) // Ajuste conforme necessário
                
            }
        }
    }
}

#Preview {
    OnboardView()
}
