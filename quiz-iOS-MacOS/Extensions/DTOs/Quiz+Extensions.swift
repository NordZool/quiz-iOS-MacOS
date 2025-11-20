//
//  Category+Extensions.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//

import Foundation
import SharedDTO

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
// MARK: - Identifiable
extension QuizDTO : @retroactive Identifiable {
    
}
// MARK: - FlexibleGridViewCell
extension QuizDTO : FlexibleGridViewCell {
    var text: String {
        self.name
    }
}
// MARK: - Hashable
extension QuizDTO : @retroactive Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public static func == (lhs: QuizDTO, rhs: QuizDTO) -> Bool {
        lhs.id == rhs.id
    }
}


