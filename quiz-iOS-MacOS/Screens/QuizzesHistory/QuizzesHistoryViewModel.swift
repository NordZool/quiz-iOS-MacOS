//
//  QuizzesHistoryViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import Combine
import SharedDTO

class QuizzesHistoryViewModel : ObservableObject {
    @Published var quizzes: [QuizDTO] = []
    
    init() {
        self.quizzes = QuizDTO.mock + QuizDTO.mock + QuizDTO.mock
    }
}
