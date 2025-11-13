//
//  QuizQuestionDTO.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import Foundation

public struct QuizQuestionDTO : Codable & Sendable {
    public var id: UUID
    public var text: String
    public var answers: [QuizQuestionAnswerDTO]?
    public var userAnswer: QuizQuestionAnswerDTO?
}
