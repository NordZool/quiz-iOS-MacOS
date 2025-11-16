//
//  QuizzesHistoryView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI

struct QuizzesHistoryView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var vm: QuizzesHistoryViewModel = .init()
    
    @State private var selectedQuizForResult: QuizDTO?
    
    var body: some View {
        ZStack(alignment: .top) {

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(self.vm.quizzes) { quiz in
                        QuizInfoButtonView(model: .quiz(quiz) ?? .empty) {
                            self.selectedQuizForResult = quiz
                        }
                        .padding(.horizontal, .appTopViewHorizontalPadding)
                        .sheet(item: self.$selectedQuizForResult) { quiz in
                            QuizResultView(vm: .init(quizId: quiz.id))
                        }
                    }
                }
                .padding(.top, .forEqualToTopTitleViewPadding)
                .padding(.vertical, 12)
            }
            .background(.secondaryBackground)
            
            TitleWithCloseButtonView(title: "История игр") {
                self.dismiss.callAsFunction()
            }
            .appTopView()
        }
    }
}

#Preview {
    QuizzesHistoryView()
}
