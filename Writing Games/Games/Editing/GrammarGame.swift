//
//  GrammarGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct GrammarGame: View {
    @State private var showError = false
    @State private var showCorrect = false
    @State var response: String = ""
    let sentence = GamesGlobalVariables.grammarSentences.shuffled().first!
    var back: () -> Void
    @State var playing = false
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.grammar.getTitle(), subtitle: "", colour: Color.timedGames, icon: GameTypes.grammar.getIcon(), action: { playing = true })
        } else {
            VStack(alignment: .leading, spacing: 24) {
                Text("Fix the grammar in this sentence:")
                Text(sentence.0).bold()
                TextEditor(text: $response)
                    .frame(height: 100, alignment: .leading)
                    .cornerRadius(6.0)
                    .border(Color.gray, width: 1)
                    .multilineTextAlignment(.leading)
                Spacer()
                StretchedButton(text: "Done", action: {
                    if sentence.1 == response {
                        showCorrect = true
                    } else {
                        showError = false
                    }
                })
            }
            .padding()
            .alert("Not quite! Try again", isPresented: $showError) {
                Button("Close", role: .cancel) { }
            }
            .alert("You got it!", isPresented: $showCorrect) {
                Button("Close", role: .cancel) {
                    
                }
            }
        }
    }
}
