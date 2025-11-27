//
//  SelectingQuizViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 12.11.25.
//

import Combine
import SharedDTO

final class SelectingQuizViewModel: ObservableObject {
    @Published var quizGroups: [QuizGroupDTO] = []
    
    // MARK: - Private properties
    private let quizRepository: QuizRepository = .shared
    
    init() {
        self.fetchQuizGroups()
    }
}
// MARK: - Private methods
private extension SelectingQuizViewModel {
    func fetchQuizGroups() {
        Task {[weak self] in
            let groups = try? await self?.quizRepository.getQuizGroups()
            guard let self else { return }
            self.quizGroups = groups ?? []
        }
    }
}
