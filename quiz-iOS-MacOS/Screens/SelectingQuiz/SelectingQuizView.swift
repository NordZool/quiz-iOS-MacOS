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
        ScrollView {
            VStack(alignment: .leading) {
                self.topTitleView
                
                FlexibleSectionedGridView(sections:  self.viewModel.quizGroups,
                                          selectedCell: self.$selectedQuizVM.quiz)
                .padding(.top, 20)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
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
            HStack(alignment: .top) {
                Text("Выбор категории")
                    .font(.title2)
                Spacer()
                Button {
                    self.dismiss.callAsFunction()
                } label: {
                    Image(systemName: "xmark")
                }
                .primaryAppButtonStyled(tint: .defaultBackground)
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
