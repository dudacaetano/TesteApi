//
//  PostView.swift
//  NetworkingChallenge
//
//  Created by rafï teixeira de oliveira on 29/08/24.
//

import SwiftUI
import AVKit

struct PostView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @State var selectedTab: TabBarItems = .home
    @State var selectedCategory: Category = .foryou
    @State var videoHeight: CGFloat = .zero
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Color.white
                    .onAppear {
                        videoHeight = proxy.frame(in: .local).height
                    }
            }
            Color.black.edgesIgnoringSafeArea(.top)
            VStack(spacing: 0) {
                ZStack {
                    ForEach(homeViewModel.videos) { video in
                        videoPlayerFor(video: video, currentVideoPlayer: video == homeViewModel.currentVideo)
                            .edgesIgnoringSafeArea(.top)
                            .offset(y: homeViewModel.isCurrentVideo(video) ? homeViewModel.heightPlayerOffset : homeViewModel.playerDismissalOffset)
                            .opacity(homeViewModel.isCurrentVideo(video) ? 1 : 0)
                            .zIndex(homeViewModel.isCurrentVideo(video) ? -1 : -99)
                            .gesture(DragGesture(minimumDistance: 50, coordinateSpace: .global)
                                .onChanged({homeViewModel.handleDragGestureChange($0)})
                                .onEnded({homeViewModel.handleEndDragGesture($0)}))
                    }
                }.frame(height: videoHeight)
            }
        }
    }
    
    @ViewBuilder
    private func videoPlayerFor(video: Video,  currentVideoPlayer: Bool) -> some View {
        if video == homeViewModel.currentVideo {
            let player = AVQueuePlayer(url: video.url!)
            CustomVideoPlayer(player: player)
                .overlay {
                    VideoPlayerOverlayView(selectedCategory: $selectedCategory, video: $homeViewModel.currentVideo)
                }
                .onAppear {
                    if currentVideoPlayer {
                        player.externalPlaybackVideoGravity = .resizeAspectFill
                        homeViewModel.currentPlayer = player
                        player.play()
                    } else {
                        player.pause()
                    }
                }
                .onDisappear {
                    homeViewModel.currentPlayer = nil
                    player.pause()
                    player.removeAllItems()
                }
        }
    }
}

#Preview {
    PostView()
}
