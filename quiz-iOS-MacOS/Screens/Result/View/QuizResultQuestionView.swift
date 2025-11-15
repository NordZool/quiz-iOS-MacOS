//
//  QuizResultQuestionView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI

struct QuizResultQuestionView: View {
    let index: Int
    let question: QuizQuestionDTO
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            self.questionIndexView
                .frame(width: 70, height: 70)
                
            self.rightView
                .frame(maxWidth: .infinity)
                
            
        }
    }
}
// MARK: - Subviews
extension QuizResultQuestionView {
    var questionIndexView: some View {
        ZStack {
            Rectangle()
                .fill(self.question.status?.color ?? .gray)
                .cornerRadius(12)
            
            Text(String(index))
                .font(.title2)
                .foregroundStyle(.white)
        }
    }
    
    var rightView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question.text)
                .font(.title3)
                .foregroundStyle(.appForegroundDark)
            VStack(alignment: .leading, spacing: 4) {
                Text("Ответ: \(question.rightAnswer?.text ?? "")")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                Text("Ваш ответ: \(question.userAnswer?.text ?? "")" )
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Button {
                //
            } label: {
                Text("Показать теорию")
                    .padding(.vertical,  6)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.secondaryForegroundDark)
            }
            .appButtonStyled(tint: .secondaryBackgroundDark)
            
            Rectangle()
                .fill(.secondaryBackgroundDark)
                .frame(height: 1)
                .padding(.top, 4)
        }
    }
}
#Preview {
    QuizResultQuestionView(index: 0, question: .mock())
        .padding(.horizontal, 10)
}
