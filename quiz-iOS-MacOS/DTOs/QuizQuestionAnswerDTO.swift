//
//  QuizQuestionAnswerDTO.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import Foundation

public struct QuizQuestionAnswerDTO : Codable & Sendable & Equatable {
    public var id: UUID
    public var text: String
    public var isCorrect: Bool?
}
