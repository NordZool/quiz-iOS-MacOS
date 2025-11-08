//
//  ChooseCategoryGridView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 7.11.25.
//

import SwiftUI

struct ChooseCategoryGridView<S: FlexibleGridViewSection, C: FlexibleGridViewCell>: View {
    let sections: [S]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(sections) { section in
                    Section {
                        self.sectionContent(for: section)
                    } header: {
                        self.header
                        .padding(.bottom, -15)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}
// MARK: - Subview
private extension ChooseCategoryGridView {
    var header: some View {
        HStack {
            Text("Test")
                .font(.title3)
            Spacer()
        }
    }
    
    func sectionContent(for section: S) -> some View {
        FlexibleView(data: section.cells, spacing: 14, alignment: .leading) { cell in
            Button {
                //
            } label: {
                Text(cell.text)
                    .frame(height: .smallButtonHeight)
            }
            .primaryAppButtonStyle()

        }
    }
}

#Preview {
    ChooseCategoryGridView<SectionModel, GridItemModel>(sections: [SectionModel.init(title: "Test", cells: [.init(text: "jlewrlgjrltr"), .init(text: "fedkjf"), .init(text: "ekrjekjfkjfrkfdjfkdjjkkjkfkdjkfdjkffdkl"), .init(text: "553"), .init(text: "343"),]),
                                      SectionModel.init(title: "Test", cells: [.init(text: "jlewrlgjrltr"), .init(text: "fedkjf"), .init(text: "ekrjekjfkjfrkfdjfkdjjkkjkfkdjkfdjkffdkl"), .init(text: "553"), .init(text: "343"),])])
}

protocol FlexibleGridViewSection : Identifiable {
    associatedtype Cell : FlexibleGridViewCell & Hashable
    
    var title: String { get }
    var cells: [Cell] { get }
}

protocol FlexibleGridViewCell {
    var text: String { get }
}
