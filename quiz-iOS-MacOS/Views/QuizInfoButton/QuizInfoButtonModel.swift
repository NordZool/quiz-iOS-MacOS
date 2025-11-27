//
//  LastGameInfoButtonModel.swift
//  quiz-ios
//
//  Created by Никита on 6.11.25.
//

import Foundation
import SharedDTO

struct QuizInfoButtonModel {
    static func latestQuiz(_ quiz: QuizDTO) -> QuizInfoButtonModel? {
        self.quiz(quiz, title: "Информация о прошлой игре")
    }
    
    static func quiz(_ quiz: QuizDTO, title: String? = nil) -> QuizInfoButtonModel? {
        guard let questionsCount = quiz.questionsCount,
              let answersCount = quiz.answersCount,
              let rightAnswersCount = quiz.rightAnswersCount else {
            return nil
        }
        
        let hintsText = if let hintsCount = quiz.hintsUseCount,
                            hintsCount != 0 {
            "(подсказок \(quiz.hintsUseCount ?? 0))"
        } else {
            "(без подсказок)"
        }
        
        return .init(title: title,
                     categoryText: quiz.name,
                     questionsText: "\(answersCount) из \(questionsCount) \(hintsText)",
                     rightAnswersText: String(rightAnswersCount))
    }
    
    static var empty: QuizInfoButtonModel {
        .init(title: nil,
              categoryText: "",
              questionsText: "",
              rightAnswersText: "")
    }
    
    let title: String?
    let categoryText: String
    let questionsText: String
    let rightAnswersText: String
}
