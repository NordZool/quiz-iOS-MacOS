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
    @StateObject var hintingVM: QuizHintingViewModel = .init()
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 22) {
                        let questions = vm.quiz?.questions ?? []
                        let zippedQuestions = Array(zip(questions.indices, questions))
                        ForEach(zippedQuestions, id: \.0) { (index,  question) in
                            // не нужный пока функционал теории
                            let isShowTheoryButton: Bool = false
                            QuizResultQuestionView(isLast: zippedQuestions.endIndex - 1 == index,
                                                   index: index + 1,
                                                   question: question,
                                                   isShowTheoryButton: isShowTheoryButton) {
                                if let quizId = self.vm.quiz?.id {
                                    self.hintingVM.getHint(quizId: quizId,
                                                           questioId: question.id)
                                }
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
            
            PopupContainer(item: self.$hintingVM.activeHint) { question in
                HintView.theory(hint: self.hintingVM.activeHint ?? "") {
                    self.hintingVM.activeHint = nil
                }
            }
        }
    }
}

#Preview {
    QuizResultView(vm: .init(quizId: .init()))
}
