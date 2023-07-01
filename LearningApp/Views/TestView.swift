//
//  TestView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 1/7/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
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
                                    if !submittedAnswer {
                                        ButtonCard(color: selectedAnswerIndex == index ? .gray : .white)
                                            .frame(height: 48)
                                    } else {
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                            // user selected the correct answer
                                            ButtonCard(color: .green)
                                                .frame(height: 48)
                                        } else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                            // user selected the wrong answer
                                            ButtonCard(color: .red)
                                                .frame(height: 48)
                                            
                                        } else if  index == model.currentQuestion!.correctIndex {
                                            // correct option not selected by user
                                            ButtonCard(color: .green)
                                                .frame(height: 48)
                                        } else {
                                            // rest of the options not selected & not correct
                                            ButtonCard(color: .white)
                                                .frame(height: 48)
                                        }
                                        
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }.foregroundColor(.black)
                            }.disabled(submittedAnswer)
                        }
                    }.padding()

                }
                
                Button{
                    if submittedAnswer == false {
                        submittedAnswer = true
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                    } else {
                        model.nextQuestion()
                        submittedAnswer = false
                        selectedAnswerIndex = nil
                        
                    }
                        
                    }
                } label: {
                    ZStack {
                        ButtonCard(color:  .green)
                            .frame(height: 48)
                        Text(buttonText)
                            .bold()
                        
                    }.foregroundColor(.white)
                        .padding()
                }.disabled(selectedAnswerIndex == nil)
                
                
            }.navigationTitle("\(model.currentModule?.category ?? "") Test")
                        } else {
            // Test hasn't loaded yet
            ProgressView()
        }
        
    }
    
    var buttonText: String {
        if submittedAnswer {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count{
                return "Finish"
            } else {
                return "Next"
            }
            
        } else {
            return "Submit"
        }
    }
}

