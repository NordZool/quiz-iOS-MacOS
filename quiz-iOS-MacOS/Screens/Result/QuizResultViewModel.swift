//
//  QuizResultViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 16.11.25.
//

import Combine
import Foundation
import SharedDTO

class QuizResultViewModel : ObservableObject {
    @Published var questions: [QuizQuestionDTO]
    
    init(quizId: UUID) {
        self.questions = QuizQuestionDTO.mocks + QuizQuestionDTO.mocks + QuizQuestionDTO.mocks
    }
}
