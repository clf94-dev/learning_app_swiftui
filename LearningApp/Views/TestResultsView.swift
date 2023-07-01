//
//  TestResultsView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 1/7/23.
//

import SwiftUI

struct TestResultsView: View {
    @EnvironmentObject var model:ContentModel
    var numCorrect: Int
    var body: some View {
        VStack{
            Spacer()
            Text(resultHeading
            )
                .font(.title)
            
            Spacer()
            
            Text("You got \(numCorrect ) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            
            Spacer()
            Button  {
                model.currentTestSelected = nil
            } label: {
                ZStack{
                    ButtonCard( color: .green)
                        .frame(height: 48)
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }
                
            }.padding()
            Spacer()
        }
    }
    
    var resultHeading: String {
        guard model.currentModule != nil else {
            return ""
        }
        let percent = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        if percent > 0.5 {
            return "Awesome!"
        } else if percent > 0.2 {
            return "Doing great!"
        }
        else {
            return "Keep learning."
        }
    }
}

struct TestResultsView_Previews: PreviewProvider {
    static var previews: some View {
        let num = 0
        TestResultsView(numCorrect: num)
    }
}
