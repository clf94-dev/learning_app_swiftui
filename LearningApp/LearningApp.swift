//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Carmen Lucas on 26/6/23.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
