//
//  WritingPrompt.swift
//  Writing Games
//
//  Created by Hannah Dadd on 20/01/2026.
//

import SwiftUI

struct HighlightedText: View {
    let colour: Color
    let words: String
    
    var body: some View {
        Text(words)
            .font(Font.custom("Bellefair-Regular", size: 18))
            .multilineTextAlignment(.center)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(colour, lineWidth: 4)
            )
    }
}

struct HighlightedTextEdit: View {
    @Binding var response: String
    let colour: Color
    let placeholder = "Write answer here"
    
    var body: some View {
        TextEditor(text: $response)
            .font(Font.custom("Bellefair-Regular", size: 18))
            .multilineTextAlignment(.center)
            .padding()
            .frame(height: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(colour, lineWidth: 2)
            )
            .overlay {
                if response.isEmpty {
                    Text(placeholder)
                        .font(Font.custom("Bellefair-Regular", size: 18))
                        .padding()
                        .allowsHitTesting(false)
                }
            }
    }
}
