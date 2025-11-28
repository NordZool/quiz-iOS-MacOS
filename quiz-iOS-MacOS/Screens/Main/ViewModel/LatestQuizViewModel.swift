//
//  LastQuizViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 16.11.25.
//

import Combine
import SharedDTO

class LatestQuizViewModel: ObservableObject {
    @Published var quiz: QuizDTO?
    
    // MARK: - Private properties
    private let userRepository: UserRepository = .shared
    
    init() {
        self.requestLatestQuiz()
    }
}
// MARK: - Internal methods
internal extension LatestQuizViewModel {
    func requestLatestQuiz() {
        Task { [weak self] in
            self?.quiz = try? await self?.userRepository.quizLatest()
        }
    }
}
