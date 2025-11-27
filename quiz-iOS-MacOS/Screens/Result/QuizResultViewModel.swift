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
    @Published var quiz: QuizDTO?
    
    // MARK: - Private properties
    private let userRepository: UserRepository = .shared
    
    init(quizId: UUID) {
        self.fetchResultQuestions(quizId: quizId)
    }
}
// MARK: - Private methods
private extension QuizResultViewModel {
    func fetchResultQuestions(quizId: UUID) {
        Task { [weak self] in
            let resultQuiz = try? await self?.userRepository.quizResult(quizId: quizId)
            self?.quiz = resultQuiz
        }
    }
}
