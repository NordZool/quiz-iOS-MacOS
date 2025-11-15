//
//  ContentView.swift
//  quiz-ios
//
//  Created by Никита on 4.11.25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var selectedQuizVM: SelectedQuizViewModel
    @StateObject var latestQuizVM: LatestQuizViewModel = .init()
    @StateObject var startQuizVM: StartQuizViewModel = .init()
    
    @State private var isChooseQuizSheetPresented: Bool = false
    @State private var isLastGameResultSheetPresenter: Bool = false
    @State private var isHistoryQuizzesSheetPresented: Bool = false
    @State private var quizForResult: QuizDTO? = nil
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            self.appLogoView
            
            Spacer()
            Spacer()
            
            CurrentCategoryButtonView(currentCategoryName: selectedQuizVM.quiz?.name) {
                self.isChooseQuizSheetPresented.toggle()
            }
            .sheet(isPresented: self.$isChooseQuizSheetPresented) {
                SelectingQuizView()
            }
            
            if let latestQuiz = self.latestQuizVM.quiz,
               let model = QuizInfoButtonModel.latestQuiz(latestQuiz) {
                QuizInfoButtonView(model: model) {
                    self.isLastGameResultSheetPresenter.toggle()
                }
                                                .sheet(isPresented: self.$isLastGameResultSheetPresenter) {
                                                    QuizResultView(vm: .init(quizId: latestQuiz.id))
                                                }
            }
           
            
            self.historyButton
                .padding(.top, 14)
                .sheet(isPresented: self.$isHistoryQuizzesSheetPresented) {
                    QuizzesHistoryView()
                }
            
            self.startGameButton
                .sheet(item: self.$startQuizVM.quiz) { quiz in
                    QuizPlayView(vm: .init(quiz: quiz),
                                 onQuizEnd: self.onQuizPlayEnded)
                        .interactiveDismissDisabled(true)
                }
                .sheet(item: self.$quizForResult) { quiz in
                    QuizResultView(vm: .init(quizId: quiz.id))
                }
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        .padding()
        .frame(width: 360)
        
    }
    
    func onQuizPlayEnded(_ quiz: QuizDTO) {
        self.quizForResult = quiz
    }
}
// MARK: - Subviews
private extension ContentView {
    var appLogoView: some View {
        Text("QUIZ")
            .foregroundStyle(.appPrimary)
            .font(.system(size: 90, weight: .semibold))
    }
    
    var historyButton: some View {
        Button {
            self.isHistoryQuizzesSheetPresented.toggle()
        } label: {
            Text("История игр")
                .font(.title3)
                .frame(maxWidth: .infinity,
                       maxHeight: .commonButtonHeight)
        }
        .primaryAppButtonStyled()
    }
    
    var startGameButton: some View {
        Button {
            Task {
                await self.startQuizVM.startQuiz(id: .init())
            }
        } label: {
            Text("Играть")
                .font(.title)
                .frame(maxWidth: .infinity,
                       maxHeight: .bigButtonHeight)
        }
        .primaryAppButtonStyled()
    }
}

#Preview {
    ContentView()
        .environmentObject(SelectedQuizViewModel())
}
