//
//  CategoryGroup.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//

import Foundation

public struct QuizGroupDTO: Codable & Sendable  {
    public var id: UUID
    public var title: String
    public var quizzes: [QuizDTO]
}

// MARK: - DEBUG
#if DEBUG

extension QuizGroupDTO {
    static var mock: [QuizGroupDTO] {
        [
            .init(id: .init(),
                  title: ["Программирование", "Медицина", "Алгоритмизация", "Еще что-то"].randomElement()!,
                  quizzes: Array(
                    QuizDTO.mock.shuffled()[Int.random(in: 0...3)...Int.random(in: 4...7)]
                  )
                 )
        ]
    }
}

#endif
