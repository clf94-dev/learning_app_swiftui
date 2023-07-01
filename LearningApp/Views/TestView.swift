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
            VStack {
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                CodeTextView()
                
            }.navigationTitle("\(model.currentModule?.category ?? "") Test")
        } else {
            // Test hasn't loaded yet
            ProgressView()
        }
        
    }
}

