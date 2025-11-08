//
//  LastGameInfoButtonView.swift
//  quiz-ios
//
//  Created by Никита on 4.11.25.
//

import SwiftUI

struct LastGameInfoButtonView: View {
    private let model: LastGameInfoButtonModel
    private let action: @MainActor () -> Void
    
    init(model: LastGameInfoButtonModel,
         action: @escaping @MainActor () -> Void) {
        self.model = model
        self.action = action
    }
    
    var body: some View {
        Button(action: self.action, label: {
            HStack {
                VStack(alignment: .leading) {
                    Text("Информация о прошлой игре")
                        .font(.subheadline)
                    Text("Категория: \(model.categoryText)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Text("Вопросы: \(model.questionsText)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Text("Правильных ответов: \(model.rightAnswersText)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
        })
        .appButtonStyle()
        .foregroundStyle(.primary)
    }
}

#Preview {
    LastGameInfoButtonView(model: .init(categoryText: "Основы",
                                        questionsText: "2/42",
                                        rightAnswersText: "0"), action: { })
        .frame(width: 300)
}
