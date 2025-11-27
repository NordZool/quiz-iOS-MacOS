//
//  StartQuizViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 16.11.25.
//

import Combine
import Foundation
import SharedDTO

class StartQuizViewModel : ObservableObject {
    @Published var quiz: QuizDTO?
    
    // MARK: - Private properties
    private let quizRepository: QuizRepository = .shared
}
// MARK: Intenal methods
internal extension StartQuizViewModel {
    func startQuiz(id: UUID) {
        Task { [weak self] in
            let quiz = try? await self?.quizRepository.playQuiz(quizId: id)
            self?.quiz = quiz
        }
    }
}
