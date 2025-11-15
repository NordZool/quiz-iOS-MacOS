//
//  StartQuizViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 16.11.25.
//

import Combine
import Foundation

class StartQuizViewModel : ObservableObject {
    @Published var quiz: QuizDTO?
    
    func startQuiz(id: UUID) async {
        self.quiz = .mock.first
    }
}
