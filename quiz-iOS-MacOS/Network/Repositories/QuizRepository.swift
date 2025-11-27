//
//  QuizRepository.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 27.11.25.
//

import Foundation
import SharedDTO

final class QuizRepository {
    static let shared: QuizRepository = .init()
    
    private let client: Networking = NetworkClient.app
    
    private init() {}
}
// MARK: - Requestis
extension QuizRepository {
    func getQuizGroups() async throws -> [QuizGroupDTO] {
        try await self.client.request(AppEndpoint.quizGroups)
    }
    
    func playQuiz(quizId: UUID) async throws -> QuizDTO {
        try await self.client.request(AppEndpoint.quizPlay(quizId: quizId))
    }
}
