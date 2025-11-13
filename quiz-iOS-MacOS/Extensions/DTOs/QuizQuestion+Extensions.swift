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
            return .green
        } else if userAnswer == answer {
            return .red
        } else {
            return .appPrimary
        }
    }
}

// MARK: - Identifiable
extension QuizQuestionDTO : Identifiable {
    
}

// MARK: - DEBUG
#if DEBUG

extension QuizQuestionDTO {
    static func mock(id: UUID = .init()) -> QuizQuestionDTO {
        let answers: [QuizQuestionAnswerDTO] = QuizQuestionAnswerDTO.mocks
        
        return .init(
            id: id,
            text: [
                "Что такое SwiftUI?",
                "Как работает Combine?",
                "Что такое MVVM?",
                "Объясните Optional в Swift"
            ].randomElement()!,
            answers: answers,
            userAnswer: [Optional<QuizQuestionAnswerDTO>.none,
                                           answers.first,
                                           answers.randomElement()].randomElement()!)
    }

    static var mocks: [QuizQuestionDTO] {
        (0..<5).map { _ in QuizQuestionDTO.mock() }
    }
}

#endif
