//
//  CategoryGroup.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//

import Foundation

public struct QuizGroupDTO: Codable {
    public let id: UUID
    public let title: String
    public let quizzes: [QuizDTO]
}

