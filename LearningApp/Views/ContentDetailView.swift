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
        VStack{
            if videoUrl != nil {
                VideoPlayer(player: AVPlayer(url: videoUrl!))
                    .cornerRadius(10)
            }
            
            if(model.hasNextLesson()) {
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack {
                        Rectangle()
                            .frame(height:48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .bold()
                            .foregroundColor(.white)
                    }
                }.padding()
                    

            }
        }.padding()
       
      
       
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
