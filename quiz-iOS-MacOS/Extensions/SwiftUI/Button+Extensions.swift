//
//  Button+Extensions.swift
//  quiz-ios
//
//  Created by Никита on 4.11.25.
//

import SwiftUI

extension Button {
    func primaryAppButtonStyle<S: ShapeStyle>(backgroundStyle: S = Gradient.primary) -> some View {
        self
            .appButtonStyle(backgroundStyle: backgroundStyle)
            .foregroundStyle(.appForegroundDark)
    }
    
    @ViewBuilder
    func appButtonStyle<S: ShapeStyle>(backgroundStyle: S = Color.defaultBackground) -> some View {
        if #available(iOS 26.0, *) {
            self
                .buttonStyle(.glass)
                .background(Capsule()
                    .fill(backgroundStyle)
                        .padding(2)
                )       
        } else {
            self
                .buttonStyle(.plain)
                .background(backgroundStyle)
                .clipped()
                .cornerRadius(12)
                .shadow(color: .primary.opacity(0.15), radius: 8)
        }
    }
}


