//
//  PopupContainer.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 16.11.25.
//
import SwiftUI

import SwiftUI

// MARK: - Popup Container

struct PopupContainer<Item, PopupContent: View>: View {
    @Binding var isPresented: Bool
    @Binding var item: Item?
    
    let popupByBool: (() -> PopupContent)?
    let popupByItem: ((Item) -> PopupContent)?
    
    init(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> PopupContent
    ) {
        self._isPresented = isPresented
        self.popupByBool = content
        
        self._item = .constant(nil)
        self.popupByItem = nil
    }
    
    init(
        item: Binding<Item?>,
        @ViewBuilder content: @escaping (Item) -> PopupContent
    ) {
        self._item = item
        self.popupByItem = content
        
        self._isPresented = .constant(false)
        self.popupByBool = nil
    }
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            if isShown {
                
                // Размытый фон
                VisualEffectBlurAdaptiveView()
                    .ignoresSafeArea()
                    .onTapGesture {
                        dismissPopup()
                    }
                    .transition(.opacity)
                
                // Попап
                popupContent()
                    .transition(.scale.combined(with: .opacity))
                    .zIndex(10)
            }
        }
        .animation(.spring(response: 0.33), value: isShown)
    }
}

// MARK: - Удобный init для Bool (как раньше)
extension PopupContainer where Item == Never {
    init(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> PopupContent
    ) {
        self._isPresented = isPresented
        self.popupByBool = content
        
        self._item = .constant(nil)
        self.popupByItem = nil
    }
}

// MARK: - Helpers

private extension PopupContainer {
    
    /// Когда нужно показывать попап
    var isShown: Bool {
        if popupByItem != nil {
            item != nil
        } else {
            isPresented
        }
    }
    
    /// Контент попапа
    @ViewBuilder
    func popupContent() -> some View {
        if let popupByBool = popupByBool, isPresented {
            popupByBool()
        } else if let popupByItem = popupByItem, let item = item {
            popupByItem(item)
        }
    }
    
    /// Закрытие попапа
    func dismissPopup() {
        if popupByItem != nil {
            item = nil
        } else {
            isPresented = false
        }
    }
}
