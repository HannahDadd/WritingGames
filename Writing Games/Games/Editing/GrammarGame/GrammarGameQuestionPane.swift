//
//  GrammarGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct GrammarGameQuestionPane: View {
    @State private var showError = false
    @State private var showCorrect = false
    @State var response: String = ""
    
    let sentence = GamesGlobalVariables.grammarSentences.shuffled().first!
    
    let onCorrect: () -> Void
    let onIncorrect: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Text(sentence.0).bold()
            WritingEditor(words: $response)
            Spacer()
            GameButton(text: "Done", action: {
                if sentence.1 == response {
                    showCorrect = true
                } else {
                    showError = false
                }
            })
        }
        .padding()
        .alert("Not quite! Try again", isPresented: $showError) {
            Button("Close", role: .cancel) {
                onIncorrect()
            }
        }
        .alert("You got it!", isPresented: $showCorrect) {
            Button("Close", role: .cancel) {
                onCorrect()
            }
        }
    }
}
