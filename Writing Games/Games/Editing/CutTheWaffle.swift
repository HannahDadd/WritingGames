//
//  ReplaceWordVide.swift
//  Get It Write
//
//  Created by Hannah Dadd on 21/10/2025.
//

import SwiftUI

struct CutTheWaffle: View {
    @State var response: String = ""
    @State var playing = false
    @State var sentence = GamesGlobalVariables.badSentences.randomElement()!

    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.editingGame.getTitle(), subtitle: "These sentences along, what words can you cut?", colour: Color.editingGames, icon: GameTypes.editingGame.getIcon(), action: { playing = true })
        } else {
            VStack(spacing: 24) {
                Spacer()
                HighlightedText(colour: Color.editingGames, words: sentence)
                HighlightedTextEdit(response: $response, colour: Color.editingGames)
                Spacer()
                GameButton(text: "Next", action: {
                    sentence = GamesGlobalVariables.badSentences.randomElement()!
                })
            }
            .padding()
            .navigationTitle(GameTypes.editingGame.getTitle())
        }
    }
}
