//
//  ChooseCategoryGridView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 7.11.25.
//

import SwiftUI

struct FlexibleSectionedGridView<S: FlexibleGridViewSection>: View {
    let sections: [S]
    
    @Binding var selectedCell: S.Cell?
    
    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(sections) { section in
                Section {
                    self.sectionContent(for: section)
                } header: {
                    self.header(for: section)
                        .padding(.bottom, -15)
                }
                .padding(.bottom, 30)
            }
        }
    }
}
// MARK: - Subview
private extension FlexibleSectionedGridView {
    func header(for section: S) -> some View {
        HStack {
            Text(section.title)
                .font(.headline)
            Spacer()
        }
    }
    
    func sectionContent(for section: S) -> some View {
        FlexibleView(data: section.cells, spacing: 14, alignment: .leading) { cell in
            Button {
                withAnimation(.linear(duration: 0.1)) {
                    self.selectedCell = if cell == self.selectedCell {
                        nil
                    } else {
                        cell
                    }
                }
            } label: {
                Text(cell.text)
                    .frame(height: .smallButtonHeight)
            }
            .primaryAppButtonStyled(tint: cell == self.selectedCell
                                   ? Color.appPrimary
                                   : Color.defaultBackground)
        }
    }
}

#Preview {
    FlexibleSectionedGridView(sections: QuizGroupDTO.mock,
                              selectedCell: .init(get: {nil}, set: {_ in}))
    .padding(.horizontal)
}
