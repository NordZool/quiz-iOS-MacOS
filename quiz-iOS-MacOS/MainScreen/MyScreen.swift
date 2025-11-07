//
//  MyScreen.swift
//  quiz-ios
//
//  Created by Никита on 6.11.25.
//

import SwiftUI

struct MyScreen: View {
    @State private var text1: String = ""
    @State private var text2: String = ""
    
    var body: some View {
        VStack {
            TextField("test", text: $text1)
            TextField("test", text: $text2)
        }
        
        MyButton(isButtonEnabled: !text1.isEmpty && !text2.isEmpty)
    }
}

#Preview {
    MyScreen()
}
