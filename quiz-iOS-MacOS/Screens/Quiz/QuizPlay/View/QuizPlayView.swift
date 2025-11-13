//
//  SwiftUIView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import SwiftUI

struct QuizPlayView: View {
    @StateObject var vm: QuizPlayViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    self.pagingQuestionsView(height: geometry.size.height)
                    
                    self.topView
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                withAnimation {
                    self.vm.quiz.questions?[0].answers?[0].isCorrect = true
                }
            }
        }
    }
}
// MARK: - Subviews
extension QuizPlayView {
    @ViewBuilder
    func pagingQuestionsView(height: CGFloat) -> some View {
        let topInset: CGFloat = 50
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(self.vm.quiz.questions ?? []) { question in
                    QuizQuestionView(question: question)
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
                    //
                } label: {
                    Text("Завершить")
                }
                .appButtonStyled()

            }

            Text(vm.quiz.answerToQuestionsText ?? "")
                
        }
        .foregroundStyle(.appForegroundDark)
        .padding(.horizontal)
        .padding(.bottom)
        .frame(maxWidth: .infinity)
            .background(
                Rectangle()
                .fill(.secondaryBackground)
                .ignoresSafeArea()

            )
    }
}

#Preview {
    QuizPlayView(vm: .init(quiz: .mock.first!))
}
