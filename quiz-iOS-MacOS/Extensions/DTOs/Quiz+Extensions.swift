//
//  Category+Extensions.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//

import Foundation

extension QuizDTO {
    var formattedQuestionsCount: String? {
        if let count = questionsCount {
            "(\(count))"
        } else {
            nil
        }
    }
}

extension QuizDTO : FlexibleGridViewCell {
    var text: String {
        self.name
    }
}

extension QuizDTO : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public static func == (lhs: QuizDTO, rhs: QuizDTO) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - DEBUG
#if DEBUG

extension QuizDTO {
    static var mock: [QuizDTO] {
        [
            .init(id: .init(), name: "Основы", questionsCount: 46, answersCount: 6, rightAnswersCount: 0),
            .init(id: .init(), name: "Работа", questionsCount: nil, answersCount: 10, rightAnswersCount: 2),
            .init(id: .init(), name: "Swift", questionsCount: 97, answersCount: 97, rightAnswersCount: 83),
            .init(id: .init(), name: "Собеседования", questionsCount: 16, answersCount: 2, rightAnswersCount: 0),
            .init(id: .init(), name: "ООП", questionsCount: 76, answersCount: nil, rightAnswersCount: 0),
            .init(id: .init(), name: "Алгоритмизация", questionsCount: nil, answersCount: nil, rightAnswersCount: nil),
            .init(id: .init(), name: "LeetCode", questionsCount: 9, answersCount: 9, rightAnswersCount: 0),
            .init(id: .init(), name: "Другое", questionsCount: 149035455646, answersCount: 20, rightAnswersCount: nil),
        ]
    }
}

#endif
