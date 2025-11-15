//
//  QuizQuestion+Extensions.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import SwiftUI

extension QuizQuestionDTO {
    func answerColor(for answer: QuizQuestionAnswerDTO) -> Color {
        guard let userAnswer else { return .appPrimary }
        
        if answer.isCorrect == true {
            return .correctAnswer
        } else if userAnswer == answer {
            return .wrongAnswer
        } else {
            return .appPrimary
        }
    }
}

// MARK: - Identifiable
extension QuizQuestionDTO : Identifiable {
    
}

