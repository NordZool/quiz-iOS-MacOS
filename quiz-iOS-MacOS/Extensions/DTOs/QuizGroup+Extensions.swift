//
//  CategoryGroup+Extensions.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//

import Foundation

extension QuizGroupDTO: FlexibleGridViewSection {
    typealias Cell = QuizDTO
    
    var cells: [Cell] {
        self.quizzes
    }
}
