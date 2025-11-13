//
//  SwiftUIView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import SwiftUI

struct QuizPlayView: View {
    let quiz: QuizDTO
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            ForEach(["t","t","t","t",], id: \.self) {_ in
                                QuizQuestionView()
                                    .padding(.horizontal)
                                    .padding(.top)
                                    .padding(.bottom, 50)
                                    .frame(height: geometry.size.height)
                                
                                
                            }
                        }
                        .padding(.top, 32)
                    }
                    .scrollTargetBehavior(.paging)
                    
                    self.topView
                   
                }
            }
           
        }
        
    }
}
// MARK: - Subviews
extension QuizPlayView {
    var topView: some View {
        ZStack {
            HStack {
                Text(quiz.rightAnswersCountAndPercentageText ?? "")
                Spacer()
            }

            Text(quiz.answerToQuestionsText ?? "")
                
        }
        .foregroundStyle(.appForegroundDark)
        .padding(.horizontal)
        .padding(.bottom)
        .frame(maxWidth: .infinity)
            .background(
                Rectangle()
                .fill(.secondaryBackground)
                .ignoresSafeArea()

            )
    }
}

#Preview {
    QuizPlayView(quiz: .mock.first!)
}
