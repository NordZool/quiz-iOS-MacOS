//
//  QuizResultView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI

struct QuizResultView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: QuizResultViewModel
    
    @State private var hintedQuestion: QuizQuestionDTO? = nil
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                TitleWithCloseButtonView(title: "Отчет по игре") {
                    dismiss.callAsFunction()
                }
                .appTopView()
                
                ScrollView {
                    VStack(spacing: 22) {
                        ForEach(Array(zip(vm.questions.indices, vm.questions)), id: \.0) { (index,  question) in
                            QuizResultQuestionView(index: index,
                                                   question: question) {
                                self.hintedQuestion = question
                            }
                        }
                    }
                    .padding(.horizontal, .appTopViewHorizontalPadding)
                    .padding(.vertical, 16)
                }
                .background(.secondaryBackground)
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
