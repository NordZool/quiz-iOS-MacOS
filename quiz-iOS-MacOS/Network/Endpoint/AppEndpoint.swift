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
    
    // MARK: user
    case getUserSelectedQuiz
    case postUserSelectedQuiz(postDTO: SelectedQuizPostDTO)
}
// MARK: - Endpoint
extension AppEndpoint : Endpoint {
    var path: String {
        switch self {
        case .quizGroups:
            "quiz/group"
            
        case .getUserSelectedQuiz, .postUserSelectedQuiz:
            "user/quiz/selected"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .quizGroups, .getUserSelectedQuiz:
                .get
            
        case .postUserSelectedQuiz:
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
}
