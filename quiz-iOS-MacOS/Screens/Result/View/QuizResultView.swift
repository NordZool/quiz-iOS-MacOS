//
//  QuizResultView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI
import SharedDTO

struct QuizResultView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: QuizResultViewModel
    
    @State private var hintedQuestion: QuizQuestionDTO? = nil
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 22) {
                        let questions = vm.quiz?.questions ?? []
                        ForEach(Array(zip(questions.indices, questions)), id: \.0) { (index,  question) in
                            QuizResultQuestionView(index: index,
                                                   question: question) {
                                self.hintedQuestion = question
                            }
                        }
                    }
                    .padding(.top, .forEqualToTopTitleViewPadding)
                    .padding(.horizontal, .appTopViewHorizontalPadding)
                    .padding(.vertical, 16)
                }
                .frame(maxWidth: .infinity)
                .background(.secondaryBackground)
                
                TitleWithCloseButtonView(title: "Отчет по игре") {
                    dismiss.callAsFunction()
                }
                .appTopView()
            }
            
            PopupContainer(item: self.$hintedQuestion) { question in
                HintView.theory(hint: "Подсказко") {
                    self.hintedQuestion = nil
                }
            }
        }
    }
}

#Preview {
    QuizResultView(vm: .init(quizId: .init()))
}
