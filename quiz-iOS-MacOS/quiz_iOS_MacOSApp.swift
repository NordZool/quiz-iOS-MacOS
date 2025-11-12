//
//  quiz_iOS_MacOSApp.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 7.11.25.
//

import SwiftUI

@main
struct quiz_iOS_MacOSApp: App {
    @StateObject var selectedQuizVM: SelectedQuizViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(selectedQuizVM)
        }
    }
}
