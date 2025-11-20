//
//  QuizPlayViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import Combine
import SharedDTO

class QuizPlayViewModel : ObservableObject {
    @Published var quiz: QuizDTO
    
    init(quiz: QuizDTO) {
        self.quiz = quiz
    }
}
