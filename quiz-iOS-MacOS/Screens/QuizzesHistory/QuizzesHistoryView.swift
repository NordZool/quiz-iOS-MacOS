//
//  QuizzesHistoryView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI

struct QuizzesHistoryView: View {
    @StateObject var vm: QuizzesHistoryViewModel = .init()
    
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("История игр")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .foregroundStyle(.appForegroundDark)
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 8)
            .frame(maxWidth: .infinity)
                .background(
                    Rectangle()
                    .fill(.secondaryBackground)
                    .ignoresSafeArea()

                )
            
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(self.vm.quizzes) { quiz in
                        QuizInfoButtonView(model: .quiz(quiz) ?? .empty) {
                            //
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.vertical, 12)
            }
        }
    }
}

#Preview {
    QuizzesHistoryView()
}
