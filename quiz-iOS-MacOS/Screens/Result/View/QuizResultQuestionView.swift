//
//  QuizResultQuestionView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI
import SharedDTO

struct QuizResultQuestionView: View {
    let isLast: Bool
    let index: Int
    let question: QuizQuestionDTO
    let showTheory: (() -> Void)?
    
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
                if let rightAnswer = question.rightAnswer?.text,
                    let userAnswer = question.userAnswer?.text {
                    Text("Ответ: \(rightAnswer)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Text("Ваш ответ: \(userAnswer)" )
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            Button(action: self.showTheory ?? { }) {
                Text("Показать теорию")
                    .padding(.vertical,  6)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.secondaryForegroundDark)
            }
            .appButtonStyled(tint: .secondaryBackgroundDark)
            
            if !isLast {
                Rectangle()
                    .fill(.secondaryBackgroundDark)
                    .frame(height: 1)
                    .padding(.top, 4)
            }
        }
    }
}
#Preview {
    QuizResultQuestionView(isLast: true, index: 0, question: .mock(), showTheory: nil)
        .padding(.horizontal, 10)
}
