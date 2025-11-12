//
//  SelectedQuizViewModel.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 12.11.25.
//

import Combine

class SelectedQuizViewModel : ObservableObject {
    @Published var quiz: QuizDTO? = nil
    
    func postSelectedQuiz() {
        
    }
}
