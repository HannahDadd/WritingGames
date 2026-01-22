//
//  PassiveToActiveQuestionPane.swift
//  Writing Games
//
//  Created by Hannah Dadd on 22/01/2026.
//

import SwiftUI

struct PassiveToActiveQuestionPane: View {
    @State private var showError = false
    @State private var showCorrect = false
    @State var response: String = ""
    
    let sentence = GamesGlobalVariables.passiveToActiveMap.shuffled().first!
    
    let onCorrect: () -> Void
    let onIncorrect: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Text(sentence.0).bold()
            HighlightedTextEdit(response: $response, colour: Color.editingGames)
            Spacer()
            GameButton(text: "Done", action: {
                if sentence.1 == response {
                    showCorrect = true
                } else {
                    showError = true
                }
            })
        }
        .padding()
        .alert("Not quite! Try again", isPresented: $showError) {
            Button("Close", role: .cancel) {
                response = ""
                onIncorrect()
            }
        }
        .alert("You got it!", isPresented: $showCorrect) {
            Button("Close", role: .cancel) {
                response = ""
                onCorrect()
            }
        }
    }
}
