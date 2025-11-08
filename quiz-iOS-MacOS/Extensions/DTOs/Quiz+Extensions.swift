//
//  Category+Extensions.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//

import Foundation

extension QuizDTO : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public static func == (lhs: QuizDTO, rhs: QuizDTO) -> Bool {
        lhs.id == rhs.id
    }
}

extension QuizDTO : FlexibleGridViewCell {
    var text: String {
        self.name
    }
}
