//
//  QuizQuestionStatus+Extensions.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI
import SharedDTO

extension QuizQuestionStatus {
    var color: Color {
        switch self {
        case .userAnswerCorrect:
                .correctAnswer
        case .userAnswerWrong:
                .wrongAnswer
        case .notAnswered:
                .gray
        }
    }
}
