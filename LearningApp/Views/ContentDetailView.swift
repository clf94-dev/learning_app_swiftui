//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 30/6/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        let lesson = model.currentLesson
        let videoUrl = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        if videoUrl != nil {
            VideoPlayer(player: AVPlayer(url: videoUrl!))
        }
       
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
