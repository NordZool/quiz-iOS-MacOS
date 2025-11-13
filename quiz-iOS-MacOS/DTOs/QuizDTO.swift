//
//  Category.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//
import Foundation

public struct QuizDTO : Codable & Sendable  {
    public var id: UUID
    public var name: String
    public var questionsCount: Int?
    public var answersCount: Int?
    public var rightAnswersCount: Int?
    public var hintsUseCount: Int?
    
    public var questions: [QuizQuestionDTO]?
}
