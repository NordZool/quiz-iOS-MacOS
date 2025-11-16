//
//  VisualEffectBlur.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 16.11.25.
//
#if os(iOS)
import UIKit
import SwiftUI

struct VisualEffectBlur: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        if #available(iOS 26.0, *) {
            UIVisualEffectView(effect: UIGlassEffect(style: .regular))
        } else {
            UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        }
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
#endif


