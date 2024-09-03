//
//  PostHomeModel.swift
//  TesteAPI
//
//  Created by Cintia Cassia Reis Braulino on 02/09/24.
//

import Foundation
import SwiftUI

struct Video: Identifiable, Equatable {
    let id: UUID
    let userName: String
    let userImageString = "image1"
    let time: String
    let videoDescription: String
    let hashtags: [String]
    let urlString: String
    var url: URL? {
        URL(string: urlString)
    }
    
    let likes = Int.random(in: 0...3000)
    let comments = Int.random(in: 0...3000)
    let bookmarked = Int.random(in: 0...3000)
    let shares = Int.random(in: 0...3000)
}

extension Video {
    static let sample: [Video] = [
        .init(id: UUID(),
              userName: "2 KM",
              time: "01:35:97",
              videoDescription: "Hoje a trilha foi curta mas demorada",
              hashtags: ["#likeplease", "#andsubscribe", "#Bike"],
              urlString:"https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
        .init(id: UUID(),
              userName: "20 KM",
              time:"06:40:59",
              videoDescription: "Dia de pegar a estrada e ir longe",
              hashtags: ["#it", "#would", "#help", "#alot"],
              urlString: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
        .init(id: UUID(),
              userName: "8 KM",
              time:"00:40:24",
              videoDescription: "Hoje foi leve, só para desestressar.",
              hashtags: ["#it", "#would", "#help", "#alot"],
              urlString: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4")
    ]
    
    static let semple: [Video] = [
        .init(id: UUID(),
              userName: "RS 2000,00",
              time: "Mountain",
              videoDescription: "Pra vender galera",
              hashtags: ["#likeplease", "#andsubscribe", "#Bike"],
              urlString:"https://www.google.com/search?q=bike+trail&client=safari&sca_esv=77d6260ac296d3e1&biw=1512&bih=779&tbm=vid&ei=_vXWZs3jC6zc1sQPhPmr6As&ved=0ahUKEwjN2rfY2KaIAxUsrpUCHYT8Cr0Q4dUDCA4&uact=5&oq=bike+trail&gs_lp=Eg1nd3Mtd2l6LXZpZGVvIgpiaWtlIHRyYWlsMgoQABiABBhDGIoFMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgAQyBRAAGIAESOcVUOQIWOQIcAB4AJABAZgBnwGgAaICqgEDMS4yuAEDyAEA-AEBmAICoAKRAcICBRAhGKABwgIFECEYnwWYAwCIBgGSBwMxLjGgB_kK&sclient=gws-wiz-video#"),
        .init(id: UUID(),
              userName: "RS 50,00",
              time:"Peças",
              videoDescription: "Vendo coroa para bike urbana",
              hashtags: ["#it", "#would", "#help", "#alot"],
              urlString: "https://www.google.com/imgres?q=bike%20trail&imgurl=https%3A%2F%2Fwww.canyon.com%2Fdw%2Fimage%2Fv2%2FBCML_PRD%2Fon%2Fdemandware.static%2F-%2FLibrary-Sites-canyon-shared%2Fdefault%2Fdwab4f0120%2Fimages%2Fplp%2Fmountain-bikes%2FRidestyle-canyon-trail-04.jpg%3Fsw%3D632%26sh%3D474%26sm%3Dcut&imgrefurl=https%3A%2F%2Fwww.canyon.com%2Fpt-br%2Fbiciclettas-btt%2Ftrail-bikes%2F&docid=DF1Hpj-TduoDgM&tbnid=jY3hGNSxeJLBtM&vet=12ahUKEwj-lYKg2qaIAxXeqJUCHbulNTYQM3oECGYQAA..i&w=632&h=474&hcb=2&ved=2ahUKEwj-lYKg2qaIAxXeqJUCHbulNTYQM3oECGYQAA"),
    ]
}

enum TabBarItems: String, CaseIterable {
    case home
    case new
    case pluslogo
    case inbox
    case profile
    
    var title: String {
        if self != .pluslogo {
            return self.rawValue.capitalized
        } else {
            return ""
        }
    }

    var icon: String {
        switch self {
        case .home:
            return "house"
        case .new:
            return "person.2"
        case .pluslogo:
            return "tiktokplus"
        case .inbox:
            return "arrow.down.message"
        case .profile:
            return "person"
        }
    }
    
    var selectedIcon: String{
        switch self {
        case .home:
            return "house.fill"
        case .new:
            return "person.2.fill"
        case .pluslogo:
            return "tiktokplus"
        case .inbox:
            return "arrow.down.message.fill"
        case .profile:
            return "person.fill"
        }
    }
}

enum Category: String, CaseIterable {
    case following
    case foryou
    
    var title: String {
        switch self {
        case .following:
            return "Na área"
        case .foryou:
            return "Seguindo"
        }
    }
}
