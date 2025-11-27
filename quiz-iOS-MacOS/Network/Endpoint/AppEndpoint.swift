//
//  AppEndpoint.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 27.11.25.
//

import Foundation
import SharedDTO

enum AppEndpoint {
    // MARK: quiz
    case quizGroups
    case quizPlay(quizId: UUID)
    
    // MARK: user
    case getUserSelectedQuiz
    case postUserSelectedQuiz(postDTO: SelectedQuizPostDTO)
    
    case userQuizHistory
    case userQuizResult(quizId: UUID)
}
// MARK: - Endpoint
extension AppEndpoint : Endpoint {
    var path: String {
        switch self {
        case .quizGroups:
            "quiz/group"
            
        case .quizPlay(let id):
            "quiz/\(id)/play"
            
        case .getUserSelectedQuiz, .postUserSelectedQuiz:
            "user/quiz/selected"
            
        case .userQuizHistory:
            "user/quiz/history"
            
        case .userQuizResult(let id):
            "user/quiz/\(id)/result"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .quizGroups, .getUserSelectedQuiz, .userQuizResult, .userQuizHistory:
                .get
            
        case .postUserSelectedQuiz, .quizPlay:
                .post
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    var body: Data? {
        switch self {
        case .postUserSelectedQuiz(let postDTO):
            postDTO.encoded
            
        default:
            nil
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        default:
            nil
        }
    }
}
