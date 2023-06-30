//
//  ContentView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 29/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        ScrollView{
            LazyVStack{
                if model.currentModule != nil{
                    ForEach (0..<model.currentModule!.content.lessons.count) { index in
                        NavigationLink(destination:
                            ContentDetailView()
                            .onAppear(perform: {
                                model.beginLesson(index)
                            })
                            , label: {
                            ContentItemView( index: index)
                                
                        })
                        
                    }
                }
            }.padding()
                .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
