//
//  VideoPlayerOverlayView.swift
//  TesteAPI
//
//  Created by Cintia Cassia Reis Braulino on 03/09/24.
//

import Foundation
import SwiftUI
import AVKit

struct VideoPlayerOverlayView: View {
    @Binding var selectedCategory: Category
    @Binding var video: Video
    var body: some View {
        VStack {
            TikTokCustomPicker(selectedCategory: $selectedCategory)
                .foregroundColor(.white)
                .padding(.top, 44)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(video.userName)
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(video.time)
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(video.videoDescription)
                        .foregroundColor(.white)
                        .font(.callout)
                    HStack {
                        ForEach(video.hashtags, id: \.self) { hashtag in
                            Text(hashtag)
                                .bold()
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                    }
                }
                .padding(8)
                Spacer()
                VStack(spacing: 20) {
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                        Image(video.userImageString)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    ForEach(OverlayVideoButtons.allCases, id:\.self) { button in
                        Button(action:{}) {
                            VStack {
                                Image(systemName: button.icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 34, height: 34)
                                .foregroundColor(.white)
                                switch button {
                                case .like:
                                    Text("\(video.likes)")
                                        .bold()
                                        .font(.callout)
                                        .foregroundColor(.white)
                                case .share:
                                    Text("\(video.shares)")
                                        .bold()
                                        .font(.callout)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(8)
            }
        }
    }
}

struct VideoPlayerOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer(player: .init()) {
            VideoPlayerOverlayView(selectedCategory: .constant(.foryou), video: .constant(Video.sample.first!))
        }
    }
}

enum OverlayVideoButtons: String, CaseIterable {
    case like
    case share
    
    var icon: String {
        switch self {
        case .like:
            return "heart.fill"
        case .share:
            return "arrowshape.turn.up.right.fill"
        }
    }
    
    var text: String {
        switch self {
        case .like:
            return "336.9k"
        case .share:
            return "37.2K"
        }
    }
}
