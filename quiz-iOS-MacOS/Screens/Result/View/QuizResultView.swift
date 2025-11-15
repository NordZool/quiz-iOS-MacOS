//
//  QuizResultView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI

struct QuizResultView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: QuizResultViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleWithCloseButtonView(title: "Отчет по игре") {
                dismiss.callAsFunction()
            }
            .appTopView()
            
            ScrollView {
                VStack(spacing: 22) {
                    ForEach(Array(zip(vm.questions.indices, vm.questions)), id: \.0) { (index,  question) in
                        QuizResultQuestionView(index: index,
                                               question: question)
                    }
                }
                .padding(.horizontal, .appTopViewHorizontalPadding)
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    QuizResultView(vm: .init(quizId: 0))
}
