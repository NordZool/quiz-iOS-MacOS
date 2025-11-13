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
    
    var answerToQuestionsText: String? {
        if let answersCount, let questionsCount {
            "\(answersCount) / \(questionsCount)"
        } else {
            nil
        }
    }
    
    var rightAnswersPercentage: Double? {
        if let rightAnswersCount, let answersCount {
            guard answersCount > 0 else {
                return 0
            }
            
            return 100 * Double(rightAnswersCount) / Double(answersCount)
        } else {
            return nil
        }
    }
    
    var rightAnswersPercentageText: String? {
        if let rightAnswersPercentage {
            "\(rightAnswersPercentage.formattedOneDecimal)%"
        } else {
            nil
        }
    }
    
    var rightAnswersCountAndPercentageText: String? {
        if let rightAnswersCount, let rightAnswersPercentageText {
            "\(rightAnswersCount) | \(rightAnswersPercentageText)"
        } else {
            nil
        }
    }
}
// MARK: - FlexibleGridViewCell
extension QuizDTO : FlexibleGridViewCell {
    var text: String {
        self.name
    }
}
// MARK: - Hashable
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
