//
//  Button+Extensions.swift
//  quiz-ios
//
//  Created by Никита on 4.11.25.
//

import SwiftUI

extension Button {
    func primaryAppButtonStyle(tint: Color = .appPrimary) -> some View {
        self
            .appButtonStyle(tint: tint)
            .foregroundStyle(.appForegroundDark)
    }
    
    @ViewBuilder
    func appButtonStyle(tint: Color = .defaultBackground) -> some View {
        if #available(iOS 26.0, *) {
            self
                .buttonStyle(.glassProminent)
                .tint(tint)
        } else {
            self
                .buttonStyle(.plain)
                .tint(tint)
                .clipped()
                .cornerRadius(12)
                .shadow(color: .primary.opacity(0.15), radius: 8)
        }
    }
}


