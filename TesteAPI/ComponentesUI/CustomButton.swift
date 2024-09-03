//
//  Components.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 26/08/24.
//

import SwiftUI

struct CustomButtonLogin: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            Text(title)
                
        }
        
        .foregroundColor(.textboard)
        .frame(width: 345, height: 46)
        .background(Color.boardbutton)
        .cornerRadius(4)
        .padding(.bottom, 20)
        /*.foregroundColor(.white)
        .frame(width: 300, height: 50)
        .background(Color.black.gradient)
        .cornerRadius(3)*/
    }
}


struct CustomButtonSignup: View{
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            Text(title)
        }
        .background(.black)
        .font(.system(size: 16))
        .fontWeight(.medium)
        .padding([.top], -10)
    }
}






struct CustomButtonLogin_Previews: PreviewProvider{
    static var previews: some View{
        CustomButtonLogin(title: " ", action: {
            print("Button tapped")
        })
        .padding()
    }
}


struct CustomButtonSignup_Previews: PreviewProvider{
    
    static var previews: some View{
        CustomButtonSignup(title: "", action:{ print("Button tapped")
        })
        .padding()
    }
}
