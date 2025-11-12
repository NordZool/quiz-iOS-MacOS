//
//  SelectingQuizViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 12.11.25.
//

import Combine

final class SelectingQuizViewModel: ObservableObject {
    @Published var quizGroups: [QuizGroupDTO] = []
    
    init() {
        self.quizGroups = QuizGroupDTO.mock + QuizGroupDTO.mock + QuizGroupDTO.mock
    }
}
