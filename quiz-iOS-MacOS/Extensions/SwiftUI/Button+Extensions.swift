//
//  Button+Extensions.swift
//  quiz-ios
//
//  Created by Никита on 4.11.25.
//

import SwiftUI

extension Button {
    func primaryAppButtonStyled(tint: Color = .appPrimary) -> some View {
        self
            .appButtonStyled(tint: tint)
            .foregroundStyle(.appForegroundDark)
    }
    
    func appButtonStyled(tint: Color = .defaultBackground) -> some View {
        self
            .defaultStyled()
            .buttonBorderShape(.roundedRectangle(radius: 16))
            .tint(tint)
    }
    
    @ViewBuilder
    private func defaultStyled() -> some View {
        if #available(iOS 26.0, macOS 26.0, *) {
            self.buttonStyle(.glassProminent)
        } else {
            self.buttonStyle(.borderedProminent)
                .appShadow()
                
        }
    }
}
