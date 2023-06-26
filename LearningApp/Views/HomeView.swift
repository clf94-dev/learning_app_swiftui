//
//  ContentView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 26/6/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        VStack {
            Text("Get Started")
            Text("What would you like to do today?")
            ScrollView{
                LazyVStack{
                    ForEach(model.modules){ module in
                        CardItemView(image: module.content.image, title: module.category, time: module.content.time, description: module.content.description, items: module.content.lessons,
                            isTest: false)
                            .padding(5)
                        CardItemView(image: module.test.image, title: module.category, time: module.test.time, description: module.test.description, items: module.test.questions,
                            isTest: true)
                            .padding(5)
                      
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
