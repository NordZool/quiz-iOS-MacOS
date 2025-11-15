//
//  QuizQuestionAnswerDTO.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import Foundation

public struct QuizQuestionAnswerDTO : Codable & Sendable & Equatable {
    public var id: UUID
    public var text: String
    public var isCorrect: Bool?
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
