//
//  VisualEffectBlurOrEmptyView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 16.11.25.
//

import SwiftUI

/// Для iOS использует UIKit эффект, для мака - нативный SwiftUI
struct VisualEffectBlurAdaptiveView: View {
    
    var body: some View {
#if os(iOS)
        VisualEffectBlur()
        
#else
        Rectangle()
                            .fill(Color.clear)
                            .background(.ultraThinMaterial)  // blur фон
                            .transition(.opacity)
#endif
    }
}
