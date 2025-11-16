//
//  QuizQuestionView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import SwiftUI

struct QuizQuestionView: View {
    let question: QuizQuestionDTO
    let hintButtonAction: (() -> Void)?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                
                // Верхняя часть — вопрос
                self.questionView
                    .frame(height: geometry.size.height * 0.5)
                
                // Нижняя часть — кнопки
                self.answersView
                .frame(height: geometry.size.height * 0.5)
            }
        }
    }
}
// MARK: - Subviews
extension QuizQuestionView {
    var questionView: some View {
        ZStack(alignment: .topTrailing) {
            Text(self.question.text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.title2)
                .background(.defaultBackground)
                .cornerRadius(16)
                .appShadow()
            
            SimpleImagedButton.info {
                self.hintButtonAction?()
            }
            .padding()
        }
    }
    
    var answersView: some View {
        VStack(spacing: 12) {
            ForEach(self.question.answers ?? []) { answer in
                self.answerButton(for: answer) {
                    //
                }
            }
        }
    }
    
    func answerButton(for answer: QuizQuestionAnswerDTO, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(answer.text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .primaryAppButtonStyled(tint: self.question.answerColor(for: answer))
        
    }
}

#Preview {
    QuizQuestionView(question: .mock(), hintButtonAction: nil)
}
