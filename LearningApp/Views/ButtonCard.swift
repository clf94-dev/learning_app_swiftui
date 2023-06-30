//
//  ButtonCard.swift
//  LearningApp
//
//  Created by Carmen Lucas on 30/6/23.
//

import SwiftUI

struct ButtonCard: View {
    var color = Color.white
    var body: some View {
        Rectangle()
            .frame(height:48)
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct ButtonCard_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCard()
    }
}
