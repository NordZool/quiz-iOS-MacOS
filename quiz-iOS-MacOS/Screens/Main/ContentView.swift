//
//  ContentView.swift
//  quiz-ios
//
//  Created by Никита on 4.11.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            Text("QUIZ")
                .foregroundStyle(.appPrimary)
                .font(.system(size: 90, weight: .semibold))
            
            Spacer()
            Spacer()
            
            CurrentCategoryButtonView(currentCategoryName: "Основы") {
                //
            }
            
            LastGameInfoButtonView(model: .init(categoryText: "Основы",
                                                questionsText: "2/42",
                                                rightAnswersText: "0")) {
                
            }
            
            self.historyButton
                .padding(.top, 14)
            
            self.startGameButton
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        .padding()
        .frame(width: 360)
        
    }
}
// MARK: - Subviews
private extension ContentView {
    var historyButton: some View {
        Button {
            //
        } label: {
            Text("История игр")
                .font(.title3)
                .frame(maxWidth: .infinity,
                       maxHeight: .commonButtonHeight)
        }
        .primaryAppButtonStyle()
    }
    
    var startGameButton: some View {
        Button {
            //
        } label: {
            Text("Играть")
                .font(.title)
                .frame(maxWidth: .infinity,
                       maxHeight: .bigButtonHeight)
        }
        .primaryAppButtonStyle()
    }
}

#Preview {
    ContentView()
}
