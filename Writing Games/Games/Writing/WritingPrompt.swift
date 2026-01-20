//
//  ExpandedPrompt.swift
//  Get It Write
//
//  Created by Hannah Dadd on 24/10/2025.
//

import SwiftUI

struct WritingPrompt: View {
    @State var playing = false
    @State var words = ""
    @State private var btnPressed = false
    let question = GamesGlobalVariables.writingPrompts.randomElement() ?? ""
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.prompt.getTitle(), subtitle: "Feeling inspired? Write a short story from this prompt.", colour: Color.writingGames, icon: GameTypes.prompt.getIcon(), action: { playing = true })
        } else {
            VStack(spacing: 8) {
                HighlightedText(colour: Color.writingGames, words: question)
                WritingEditor(words: $words)
                Spacer()
                GameButton(text: "Share", action: {
                    btnPressed = true
                })
            }
            .padding()
            .navigationTitle(GameTypes.prompt.getTitle())
        }
    }
}
