//
//  PickerPerfil.swift
//  NetworkingChallenge
//
//  Created by rafï teixeira de oliveira on 27/08/24.
//

import SwiftUI
import UIKit

struct PerfilView: View {
    @State var selected = 1
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.cinzabg
                    .ignoresSafeArea()
                
                VStack{
                    UserInfo()
                        .padding([.bottom], 30)
                    
                    Picker(selection: $selected, label: Text("Picker"), content: {
                        Text("Feed")
                            .tag(1)
                            .fontWeight(.semibold)
                        Text("Anúncios")
                            .tag(2)
                            .fontWeight(.semibold)
                        Text("Salvos")
                            .tag(3)
                            .fontWeight(.semibold)
                    
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 350)
                    .padding([.bottom], -15)
                    
                    switch selected {
                    case 1:
                        FeedGrid()
                            .frame(width:396, height:510)
                    case 2:
                        FeedGrid()
                            .frame(width:396, height:510)
                    case 3:
                        FeedGrid()
                            .frame(width:396, height:510)

                    default:
                        EmptyView()
                        
                    }
                }
            }
            
        }
        .onAppear {
            UISegmentedControl.appearance().setTitleTextAttributes(
                [.foregroundColor: UIColor(named: "vermelhopicker")!],
                for: .selected
            )
        }
    }
}

#Preview {
    PerfilView()
}
