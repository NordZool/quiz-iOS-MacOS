//
//  LastGameInfoButtonModel.swift
//  quiz-ios
//
//  Created by Никита on 6.11.25.
//

import Foundation

struct LastGameInfoButtonModel {
    static func quiz(_ quiz: QuizDTO) -> LastGameInfoButtonModel? {
        guard let questionsCount = quiz.questionsCount,
              let answersCount = quiz.answersCount,
              let rightAnswersCount = quiz.rightAnswersCount else {
            return nil
        }
        
        return .init(categoryText: quiz.name,
                     questionsText: "\(answersCount)/\(questionsCount)",
                     rightAnswersText: String(rightAnswersCount))
    }
    
    let categoryText: String
    let questionsText: String
    let rightAnswersText: String
}
