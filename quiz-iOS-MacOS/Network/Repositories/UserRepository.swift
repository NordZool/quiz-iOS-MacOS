//
//  UserRepository.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 27.11.25.
//

import Foundation
import SharedDTO

class UserRepository {
    static let shared: UserRepository = .init()
    
    private let client: Networking = NetworkClient.app
    
    private init() { }
    
    
}
// MARK: - Requestis
extension UserRepository {
    func getSelectedQuiz() async throws -> QuizDTO? {
        try await self.client.request(AppEndpoint.getUserSelectedQuiz)
    }
    
    func postSelectedQuiz(_ postDTO: SelectedQuizPostDTO) async throws {
        try await self.client.request(AppEndpoint.postUserSelectedQuiz(postDTO: postDTO))
    }
}
