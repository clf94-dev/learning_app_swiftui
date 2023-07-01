//
//  TestView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 1/7/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        if model.currentQuestion != nil {
            VStack (alignment: .leading) {
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)").padding(.leading, 20)

        
                // question text
                CodeTextView().padding(.horizontal, 20)

                
                // answers
                ScrollView{
                    VStack (alignment: .leading){
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self){ index in
                            
                            Button{
                               // TODO
                            } label: {
                                ZStack {
                                    ButtonCard(color: .white)
                                        .frame(height: 48)
                                    Text(model.currentQuestion!.answers[index])
                                }.foregroundColor(.black)
                            }
                        }
                    }.padding()

                }
                
                
            }.navigationTitle("\(model.currentModule?.category ?? "") Test")
                        } else {
            // Test hasn't loaded yet
            ProgressView()
        }
        
    }
}

