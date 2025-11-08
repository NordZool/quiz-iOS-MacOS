//
//  ChooseCategoryView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 7.11.25.
//

import SwiftUI

struct ChooseCategoryView: View {
    
    let sections: [SectionModel] = [SectionModel.init(title: "Test", cells: [GridItemModel.init(text: "jlewrlgjrltr"), GridItemModel.init(text: "fedkjf"), GridItemModel.init(text: "ekrjekjfkjfrkfdjfkdjjkkjkfkdjkfdjkffdkl"), GridItemModel.init(text: "553"), GridItemModel.init(text: "343"),]),
                                  SectionModel.init(title: "Test", cells: [GridItemModel.init(text: "jlewrlgjrltr"), GridItemModel.init(text: "fedkjf"), GridItemModel.init(text: "ekrjekjfkjfrkfdjfkdjjkkjkfkdjkfdjkffdkl"), GridItemModel.init(text: "553"), GridItemModel.init(text: "343"),])]
    
    @State private var selectedCategory: GridItemModel? = nil
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                self.topTitleView
                
                FlexibleSectionedGridView(sections:  self.sections,
                                       selectedCell: self.$selectedCategory)
                .padding(.top, 20)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
    }
}
// MARK: - Subviews
private extension ChooseCategoryView {
    var topTitleView: some View {
        VStack(alignment: .leading) {
            Text("Выбор категории")
                .font(.title2)
            Text("Основы (46)")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Под снос, когда будут реальные
struct SectionModel {
    let id = UUID()
    let title: String
    let cells: [GridItemModel]
}

extension SectionModel : FlexibleGridViewSection {
    typealias Cell = GridItemModel
}

struct GridItemModel : Hashable & FlexibleGridViewCell {
    let text: String
}

#Preview {
    ChooseCategoryView()
}
