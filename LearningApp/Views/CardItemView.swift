//
//  CardItemView.swift
//  LearningApp
//
//  Created by Carmen Lucas on 26/6/23.
//

import SwiftUI

struct CardItemView: View {
    var image: String
    var title: String
    var time: String
    var description: String
    var items:[Any]
    var isTest: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            HStack (spacing: 5){
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                    .padding(.horizontal, 10)
                VStack(alignment: .leading){
                    Spacer()
                    if isTest {
                        Text("\(title) Test")
                            .bold()
                            .font(.system(size: 16))
                            .padding(.bottom, 5)
                    } else {
                        Text("Learn \(title)")
                            .bold()
                            .font(.system(size: 16))
                            .padding(.bottom, 5)
                    }
                    Text(description)
                        .font(.system(size: 12))
                       
                        
                    HStack{
                        HStack{
                            Image(systemName: "text.book.closed")
                                .resizable()
                                .frame(width: 15, height:15)
                                .foregroundColor(.gray)
                            if isTest {
                                Text("\(items.count) Questions")
                                    .foregroundColor(.gray)
                                    .bold()
                                    .font(.system (size:10))
                            } else {
                                Text("\(items.count) Lessons")
                                    .foregroundColor(.gray)
                                    .bold()
                                    .font(.system (size:10))
                                
                            }
                        }
                        HStack{
                            Image(systemName: "stopwatch")
                                .resizable()
                                .frame(width: 15, height:15)
                                .foregroundColor(.gray)
                            Text(time)
                                .foregroundColor(.gray)
                                .bold()
                                .font(.system (size:10))
                        }

                    }.padding(.top, 20)
                    Spacer()
                }.padding(5)
            }
        }
        
    }
}

struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        CardItemView(image: model.modules[0].content.image, title: model.modules[0].category, time: model.modules[0].content.time,
                     description: model.modules[0].content.description, items: model.modules[0].content.lessons, isTest: false
            )
        //CardItemView(module: model.modules[0].content)
           
    }
}
