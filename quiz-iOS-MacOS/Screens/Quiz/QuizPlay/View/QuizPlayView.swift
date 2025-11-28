//
//  SwiftUIView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import SwiftUI
import SharedDTO

struct QuizPlayView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: QuizPlayViewModel
    
    @State private var hintedQuestion: QuizQuestionDTO? = nil
    
    let onQuizEnd: ((QuizDTO) -> ())?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        self.pagingQuestionsView(height: geometry.size.height)
                            .background(.secondaryBackground)
                        
                        self.topView
                    }
                    .animation(.linear, value: self.vm.quiz)
                }
                
                PopupContainer(item: self.$hintedQuestion) { hintedQuestion in
                    HintView.quizQuestionHint(hint: "Подсказка") {
                        self.hintedQuestion = nil
                    }
                }
            }
        }
        .onChange(of: self.vm.forceDismissView) { oldValue, newValue in
            if newValue {
                self.closeView()
            }
        }
    }
    
    func closeView() {
        self.dismiss.callAsFunction()
        self.onQuizEnd?(self.vm.quiz)
    }
}
// MARK: - Subviews
extension QuizPlayView {
    @ViewBuilder
    func pagingQuestionsView(height: CGFloat) -> some View {
        let topInset: CGFloat = 55
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(self.vm.quiz.questions ?? []) { question in
                    QuizQuestionView(question: question,

                                     answerButtonAction: { answer in
                        self.vm.answer(questionId: question.id,
                                       answerId: answer.id)
                    },
                                     hintButtonAction: {
                        self.hintedQuestion = question
                    })
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, topInset + 30)
                    .frame(height: height)
                    
                    
                }
            }
            .padding(.top, topInset)
            .padding(.bottom, -topInset)
        }
        .scrollTargetBehavior(.paging)
    }
    
    var topView: some View {
        ZStack {
            HStack {
                Text(vm.quiz.rightAnswersCountAndPercentageText ?? "")
                
                Spacer()
                
                Button {
                    self.closeView()
                } label: {
                    Text("Завершить")
                }
                .appButtonStyled()
            }

            Text(vm.quiz.answerToQuestionsText ?? "")
                
        }
        .foregroundStyle(.appForegroundDark)
        .appTopView()
    }
}

#Preview {
    QuizPlayView(vm: .init(quiz: .mock.first!), onQuizEnd: nil)
}
