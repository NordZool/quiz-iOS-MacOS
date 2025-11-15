//
//  Category.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//
import Foundation

public struct QuizDTO : Codable & Sendable  {
    public var id: UUID
    public var name: String
    public var questionsCount: Int?
    public var answersCount: Int?
    public var rightAnswersCount: Int?
    public var hintsUseCount: Int?
    
    public var questions: [QuizQuestionDTO]?
}

// MARK: - DEBUG
#if DEBUG

extension QuizDTO {
    static var mock: [QuizDTO] {
        [
            .init(id: .init(), name: "Основы", questionsCount: 46, answersCount: 6, rightAnswersCount: 0, hintsUseCount: 0, questions: QuizQuestionDTO.mocks),
            .init(id: .init(), name: "Работа", questionsCount: nil, answersCount: 10, rightAnswersCount: 2, hintsUseCount: 0, questions: QuizQuestionDTO.mocks),
            .init(id: .init(), name: "Swift", questionsCount: 97, answersCount: 97, rightAnswersCount: 83, hintsUseCount: 0, questions: QuizQuestionDTO.mocks),
            .init(id: .init(), name: "Собеседования", questionsCount: 16, answersCount: 2, rightAnswersCount: 0, hintsUseCount: 4, questions: QuizQuestionDTO.mocks),
            .init(id: .init(), name: "ООП", questionsCount: 76, answersCount: nil, rightAnswersCount: 0, hintsUseCount: 0, questions: QuizQuestionDTO.mocks),
            .init(id: .init(), name: "Алгоритмизация", questionsCount: nil, answersCount: nil, rightAnswersCount: nil, hintsUseCount: 0, questions: QuizQuestionDTO.mocks),
            .init(id: .init(), name: "LeetCode", questionsCount: 9, answersCount: 9, rightAnswersCount: 0, hintsUseCount: 0, questions: QuizQuestionDTO.mocks),
            .init(id: .init(), name: "Другое", questionsCount: 149035455646, answersCount: 20, rightAnswersCount: nil, hintsUseCount: 10, questions: QuizQuestionDTO.mocks),
        ]
    }
}

#endif
