//
//  TitleWithCloseButton.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 15.11.25.
//

import SwiftUI

struct TitleWithCloseButtonView: View {
    let title: String
    let action: @MainActor () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.title2)
            
            Spacer()
            
            SimpleImagedButton.close(action: self.action)
        }
        .foregroundStyle(.appForegroundDark)
    }
}

#Preview {
    TitleWithCloseButtonView(title: "TEst", action: { })
}
