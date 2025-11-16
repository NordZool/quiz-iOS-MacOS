//
//  ChooseCategoryView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 7.11.25.
//

import SwiftUI

struct SelectingQuizView: View {
    @EnvironmentObject var selectedQuizVM: SelectedQuizViewModel
    @StateObject var viewModel: SelectingQuizViewModel = .init()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                FlexibleSectionedGridView(sections:  self.viewModel.quizGroups,
                                          selectedCell: self.$selectedQuizVM.quiz)
                .padding(.top, .forEqualToTopTitleViewPadding + 16)
                .padding(.horizontal, .appTopViewHorizontalPadding)
                .padding(.vertical, 20)
            }
            .background(.secondaryBackground)
            
            self.topTitleView
                .appTopView()
        }
        
        .onChange(of: self.selectedQuizVM.quiz) { oldValue, newValue in
            self.selectedQuizVM.postSelectedQuiz()
            if newValue != nil {
                self.dismiss.callAsFunction()
            }
        }
    }
}
// MARK: - Subviews
private extension SelectingQuizView {
    var topTitleView: some View {
        VStack(alignment: .leading) {
            TitleWithCloseButtonView(title: "Выбор категории") {
                self.dismiss.callAsFunction()
            }
            
            Text("\(self.selectedQuizVM.quiz?.name ?? "") \(self.selectedQuizVM.quiz?.formattedQuestionsCount, default: "")")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    SelectingQuizView()
        .environmentObject(SelectedQuizViewModel())
}
