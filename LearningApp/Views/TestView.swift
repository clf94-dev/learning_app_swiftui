//
//  TestView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 1/7/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex = -1
    @State var numCorrect = 0
    @State var submittedAnswer = false
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
                                selectedAnswerIndex = index
                            } label: {
                                ZStack {
                                    ButtonCard(color: selectedAnswerIndex == index ? .gray : .white)
                                        .frame(height: 48)
                                    Text(model.currentQuestion!.answers[index])
                                }.foregroundColor(.black)
                            }.disabled(submittedAnswer)
                        }
                    }.padding()

                }
                
                Button{
                    submittedAnswer = true
                    if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                        numCorrect += 1
                    }
                } label: {
                    ZStack {
                        ButtonCard(color:  .green)
                            .frame(height: 48)
                        Text("Submit")
                            .bold()
                        
                    }.foregroundColor(.white)
                        .padding()
                }
                
                
            }.navigationTitle("\(model.currentModule?.category ?? "") Test")
                        } else {
            // Test hasn't loaded yet
            ProgressView()
        }
        
    }
}

