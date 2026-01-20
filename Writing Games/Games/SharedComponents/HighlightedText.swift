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
