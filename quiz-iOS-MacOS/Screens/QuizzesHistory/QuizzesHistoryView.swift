//
//  QuizzesHistoryView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI

struct QuizzesHistoryView: View {
    @StateObject var vm: QuizzesHistoryViewModel = .init()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            TitleWithCloseButtonView(title: "История игр") {
                self.dismiss.callAsFunction()
            }
            .appTopView()
            
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(self.vm.quizzes) { quiz in
                        QuizInfoButtonView(model: .quiz(quiz) ?? .empty) {
                            //
                        }
                        .padding(.horizontal, .appTopViewHorizontalPadding)
                    }
                }
                .padding(.vertical, 12)
            }
        }
    }
}

#Preview {
    QuizzesHistoryView()
}
