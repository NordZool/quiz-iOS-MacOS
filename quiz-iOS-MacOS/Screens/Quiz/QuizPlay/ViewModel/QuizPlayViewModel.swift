//
//  QuizPlayViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import Foundation
import Combine
import SharedDTO

class QuizPlayViewModel : ObservableObject {
    @Published var quiz: QuizDTO
    
    // MARK: - Private properties
    private let userRepository: UserRepository = .shared
    
    init(quiz: QuizDTO) {
        self.quiz = quiz
    }
}
// MARK: - Internal methods
internal extension QuizPlayViewModel {
    func answer(questionId: UUID, answerId: UUID) {
        Task { [weak self] in
            if let quizId = self?.quiz.id,
               let updatedQuiz = try? await self?.userRepository.quizAnswer(quizId: quizId,
                                                                                postDTO: .init(questionId: questionId,
                                                                                               answerId: answerId)) {
                self?.quiz = updatedQuiz
            }
        }
    }
}
