//
//  splashScreen.swift
//  TesteAPI
//
//  Created by Maria Eduarda on 29/08/24.
//

import SwiftUI

struct splashScreen: View {
    
    @State private var isActive: Bool =  false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack{
            
            if self.isActive{
                HomeView()
            } else {
                
                VStack{
                    HStack{
                        Text("Flip")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .bold()
                            .italic()
                            
                        Text("Flop")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .italic()
                            //.font(Font.custom("Baskerville-Bold", size: 26))
                    }
                    Text("Single Speed & Fixas")
                        .font(.headline)
                    
                    Image(systemName: "bicycle")
                        .resizable()
                        .frame(width: 80, height: 50)
                        .foregroundColor(.red)
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation(.easeIn(duration: 1.2 )){
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    splashScreen()
}
