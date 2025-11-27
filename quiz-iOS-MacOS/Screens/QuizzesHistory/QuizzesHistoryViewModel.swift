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
    
    // MARK: - Private properties
    private let userRepository: UserRepository = .shared
    
    init() {
        self.fetchQuizzes()
    }
}
// MARK: - Private methods
private extension QuizzesHistoryViewModel {
    func fetchQuizzes() {
        Task { [weak self] in
            let historedQuizzes = try? await self?.userRepository.quizzesHistory()
            self?.quizzes = historedQuizzes ?? []
        }
    }
}
