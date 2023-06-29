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
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("Get Started")
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom, 3)
                Text("What would you like to do today?")
                    .padding(.bottom, 15)
                ScrollView{
                    LazyVStack{
                        ForEach(model.modules){ module in
                            NavigationLink(destination:
                                ContentView()
                                .onAppear(perform: {
                                    model.beginModule(module.id)
                                }), label: {
                                CardItemView(image: module.content.image, title: module.category, time: module.content.time, description: module.content.description, items: module.content.lessons,
                                    isTest: false)
                                .padding(5)
                                })
                            CardItemView(image: module.test.image, title: module.category, time: module.test.time, description: module.test.description, items: module.test.questions,
                                isTest: true)
                                .padding(5)
                          
                        }
                    }.foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}