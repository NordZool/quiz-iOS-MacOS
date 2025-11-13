//
//  CategoryGroup.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//

import Foundation

public struct QuizGroupDTO: Codable & Sendable  {
    public var id: UUID
    public var title: String
    public var quizzes: [QuizDTO]
}

