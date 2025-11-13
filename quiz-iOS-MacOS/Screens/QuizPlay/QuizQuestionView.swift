//
//  QuizQuestionView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import SwiftUI

struct QuizQuestionView: View {
    private let question: String = "Question"
    private let answers: [String] = ["1", "2", "3"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                
                // Верхняя часть — вопрос
                self.questionView
                    .frame(height: geometry.size.height * 0.5)
                
                // Нижняя часть — кнопки
                VStack(spacing: 12) {
                    ForEach(self.answers, id: \.self) { answer in
                        self.answerButton(for: answer) {
                            //
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.5)
            }
        }
//        .padding()
        
    }
}
// MARK: - Subviews
extension QuizQuestionView {
    var questionView: some View {
        ZStack(alignment: .topTrailing) {
            Text(self.question)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.title2)
                .background(.defaultBackground)
                .cornerRadius(16)
                .appShadow()
            
            SimpleImagedButton.info {
                //
            }
            .padding()
        }
    }
    
    func answerButton(for answer: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(answer)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .primaryAppButtonStyled()
        
    }
}

#Preview {
    QuizQuestionView()
}
