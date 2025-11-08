//
//  CurrentCategoryButtonView.swift
//  quiz-ios
//
//  Created by Никита on 4.11.25.
//

import SwiftUI

struct CurrentCategoryButtonView: View {
    
    private let action: @MainActor () -> Void
    private var currentCategoryName: String?
    
    init(currentCategoryName: String?,
         action: @escaping () -> Void) {
        self.action = action
        self.currentCategoryName = currentCategoryName
    }
    
    var body: some View {
        Button(action: self.action, label: {
            HStack {
                VStack(alignment: .leading) {
                    Text("Текущая категория:")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    if let currentCategoryName {
                        Text(currentCategoryName)
                            .font(.subheadline)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right.circle")
                    .foregroundStyle(.secondary)
            }
            
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
        })
        .appButtonStyle()
        .foregroundStyle(.primary)
    }
}

#Preview {
    CurrentCategoryButtonView(currentCategoryName: "Основной", action:   {} )
        .frame(width: 300)
}
