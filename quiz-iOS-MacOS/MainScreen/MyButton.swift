//
//  MyButton.swift
//  quiz-ios
//
//  Created by Никита on 6.11.25.
//

import SwiftUI

struct MyButton: View {
    private let isButtonEnabled: Bool
    
    init(isButtonEnabled: Bool) {
        self.isButtonEnabled = isButtonEnabled
    }
    
    var body: some View {
        Button("sign up") {
                        // Действие кнопки
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(isButtonEnabled ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .disabled(!isButtonEnabled)
                    .animation(.easeInOut, value: self.isButtonEnabled)
    }
}

#Preview {
    MyButton(isButtonEnabled: true)
}
