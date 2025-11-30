//
//  PopupView.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 16.11.25.
//
import SwiftUI

struct HintView: View {
    static func theory(hint: String, buttonAction: @escaping () -> Void) -> HintView {
        .init(title: "Теория", hint: hint, buttonText: "Вернуться к отчету", buttonAction: buttonAction)
    }
    
    static func quizQuestionHint(hint: String, buttonAction: @escaping () -> Void) -> HintView {
        .init(title: "Подсказка", hint: hint, buttonText: "Вернуться в игру", buttonAction: buttonAction)
    }
    
    let title: String
    let hint: String
    let buttonText: String
    let buttonAction: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            self.titleView
            
            
            VStack(alignment: .leading, spacing: 18) {
                self.separatorView
                self.hintView
                    .frame(maxWidth: .infinity)
                self.buttonView
            }
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding(.horizontal, 32)
    }
}
// MARK: - Subviews
private extension HintView {
    var titleView: some View {
        Text(self.title)
            .font(.title3)
            .foregroundStyle(.appForegroundDark)
    }
    
    var separatorView: some View {
        Rectangle()
            .fill(.secondaryBackgroundDark)
            .frame(height: 1)
    }
    
    var hintView: some View {
        Text(self.hint)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
    }
    
    var buttonView: some View {
        Button(action: self.buttonAction) {
            Text(self.buttonText)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
        }
        .primaryAppButtonStyled()
    }
}

fileprivate struct TestView: View {
    @State private var showPopup = false

    var body: some View {
        ZStack {
            ContentView()
                
            
            VStack(spacing: 30) {
                Button("Show Popup") {
                    showPopup = true
                }
                .appButtonStyled()
                .font(.title)
                .foregroundStyle(.red)
            }
            
            PopupContainer(isPresented: $showPopup) {
                HintView(title: "Теория",
                         hint: "Теория Теория Теория Теория Теория Теория ТеорияТеорияТеория ТеорияТеорияТеорияТеория ТеорияТеорияТеория ТеорияТеорияТеорияТеория",
                         buttonText: "Вернуться в игру") {
                    self.showPopup = false
                }
            }
        }
    }
}



#Preview {
    TestView()
        .environmentObject(SelectedQuizViewModel())
}
