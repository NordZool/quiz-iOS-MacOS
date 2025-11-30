//
//  SelectedQuizViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 12.11.25.
//

import Combine
import SharedDTO

class SelectedQuizViewModel : ObservableObject {
    @Published var quiz: QuizDTO? = nil
    
    // MARK: - Private properties
    private let userRepository: UserRepository = .shared
    
    init() {
        self.fetchQuiz()
    }
}
// MARK: - Internal methods
internal extension SelectedQuizViewModel {
    func postSelectedQuiz() {
        Task { [weak self] in
            let postDTO: SelectedQuizPostDTO = .init(quizId: self?.quiz?.id)
            try? await self?.userRepository.postSelectedQuiz(postDTO)
        }
    }
}
// MARK: - Private methods
private extension SelectedQuizViewModel {
    func fetchQuiz() {
        Task { [weak self] in
            self?.quiz = try? await self?.userRepository.getSelectedQuiz()
        }
    }
}
