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
            // MARK: - Description
            CodeTextView()
            // MARK: - Next Lesson Button
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack {
                        ButtonCard(color: .green)
                            .frame(height:48)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .bold()
                            .foregroundColor(.white)
                    }
                }.padding()
                    

            }
            else {
                // Show complete button
                Button {
                    // take user back to the homeView
                    model.currentContentSelected = nil
                }
                label: {
                    
                    ZStack {
                        ButtonCard(color: .green)
                            .frame(height:48)
                        Text("Complete")
                            .bold()
                            .foregroundColor(.white)
                    }
                }.padding()
            }
        }.padding()
            .navigationTitle(lesson?.title ?? "")
       
      
       
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
