//
//  QuizQuestionStatus.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import Foundation

public enum QuizQuestionStatus : String, Codable & Sendable {
    case userAnswerCorrect
    case userAnswerWrong
    case notAnswered
}
