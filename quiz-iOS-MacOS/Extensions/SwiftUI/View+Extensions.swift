//
//  View+Extensions.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 13.11.25.
//

import SwiftUI

extension View {
    func appShadow() -> some View {
        self
            .shadow(color: .black.opacity(0.15), radius: 8)
    }
}
