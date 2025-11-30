//
//  QuizHintingViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 30.11.25.
//

import Combine
import Foundation

class QuizHintingViewModel: ObservableObject {
    
    @Published var activeHint: String?
    
    // MARK: - Private methods
    private let userRepository: UserRepository = .shared
    
    init() {}
}
// MARK: - Internal methods
extension QuizHintingViewModel {
    func getHint(quizId: UUID, questioId: UUID) {
        Task { [weak self] in
            let hint = try? await self?.userRepository.getHint(quizId: quizId, queryItems: [.init(name: "questionId",
                                                                                            value: questioId.uuidString)])
            self?.activeHint = hint
        }
    }
}
// MARK: - Private methods
private extension QuizHintingViewModel {
    
}
