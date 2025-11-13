//
//  CloseButton.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 12.11.25.
//

import SwiftUI

struct SimpleImagedButton: View {
    static func close(action: @escaping @MainActor () -> Void) -> SimpleImagedButton {
        .init(action: action, systemImageName: "xmark")
    }
    
    static func info(action: @escaping @MainActor () -> Void) -> SimpleImagedButton {
        .init(action: action, systemImageName: "info")
    }
    
    var action: @MainActor () -> Void
    var systemImageName: String
    
    var body: some View {
        
        Button(action: self.action) {
            Image(systemName: systemImageName)
        }
        .primaryAppButtonStyled(tint: .defaultBackground)
    }
}

#Preview {
    SimpleImagedButton(action: { }, systemImageName: "xmark")
}
