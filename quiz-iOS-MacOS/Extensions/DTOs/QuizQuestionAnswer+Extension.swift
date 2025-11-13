//
//  QuizQuestionAnswerDTO.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import Foundation

// MARK: - Identifiable
extension QuizQuestionAnswerDTO : Identifiable {
    
}

// MARK: - DEBUG
#if DEBUG

extension QuizQuestionAnswerDTO {
    static func mock(id: UUID = .init(), isCorrect: Bool = .random()) -> QuizQuestionAnswerDTO {
        .init(
            id: id,
            text: ["Ответ A", "Ответ B", "Ответ C", "Ответ D"].randomElement()!,
            isCorrect: isCorrect
        )
    }

    static var mocks: [QuizQuestionAnswerDTO] {
        let currectIndex = (0..<4).randomElement()!
        return (0..<4).map { index in QuizQuestionAnswerDTO.mock(isCorrect: currectIndex == index) }
    }
}

#endif
