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
    
    func getQuizGroups() async throws -> [QuizGroupDTO] {
        try await self.client.request(AppEndpoint.quizGroups)
    }
}
