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
    let conflict = GamesGlobalVariables.characterSituations.randomElement() ?? ""
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.conflict.getTitle(), subtitle: "This character is in a sticky situation, can you get them out of it?", colour: Color.writingGames, icon: GameTypes.conflict.getIcon(), action: { playing = true })
        } else {
            VStack {
                HighlightedText(colour: Color.writingGames, words: conflict)
                WritingEditor(words: $response)
                Spacer()
                ShareAndSaveWriting(saveText: response, shareText: "Given this conflict \(conflict) \nI wrote this resolution: \(response)", appStorageKey: GameTypes.conflict.getAppStorageName())
            }
            .padding()
            .navigationTitle(GameTypes.conflict.getTitle())
        }
    }
}
