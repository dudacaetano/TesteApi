//
//  CustomTextField.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        
        if isSecure{
            SecureField(placeholder, text:$text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View{
        VStack {
            CustomTextField(placeholder: "Username", text: .constant(""))
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            CustomTextField(placeholder: "Name", text: .constant(""))
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            CustomTextField(placeholder: "Password", text: .constant(""))
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
        }
        .padding()
    }
}
