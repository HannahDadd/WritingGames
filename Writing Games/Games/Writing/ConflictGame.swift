//
//  ConflictGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 18/01/2026.
//

import SwiftUI

struct ConflictGame: View {
    @State var playing = false
    @State var response: String = ""
    @State private var btnPressed = false
    let c = GamesGlobalVariables.characterSituations.randomElement() ?? ""
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.conflict.getTitle(), subtitle: "This character is in a sticky situation, can you get them out of it?", colour: Color.writingGames, icon: GameTypes.conflict.getIcon(), action: { playing = true })
        } else {
            VStack {
                HighlightedText(colour: Color.writingGames, words: c)
                WritingEditor(words: $response)
                Spacer()
                GameButton(text: "Share", action: {
                    btnPressed = true
                })
            }
            .padding()
            .navigationTitle(GameTypes.conflict.getTitle())
        }
    }
}
