//
//  ContentItemView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 29/6/23.
//

import SwiftUI

struct ContentItemView: View {
    @EnvironmentObject var model:ContentModel
    var index: Int
    var lesson: Lesson {
        if model.currentModule != nil && index < model.currentModule!.content.lessons.count {
            return model.currentModule!.content.lessons[index]
        }
        else {
            return Lesson(id: 0, title: "", video: "", duration: "", explanation: "")
        }
    }
    var body: some View {
            ZStack (alignment: .leading){
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(height:66)
                HStack (spacing: 30) {
                    Text(String(index + 1))
                        .bold()
                    VStack(alignment: .leading){
                        Text(lesson.title)
                            .bold()
                        Text(lesson.duration)
                    }
                    
                }.padding()
            }.padding(.bottom, 5)
                .foregroundColor(.black)
        
    }
}

// struct ContentItemView_Previews: PreviewProvider {
  //  static var previews: some View {
   //     ContentItemView(lesson: , )
 //   }
//}
