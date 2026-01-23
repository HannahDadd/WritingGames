//
//  HookyFirstSentenceGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 19/01/2026.
//

import SwiftUI

struct HookyFirstSentenceGame: View {
    @State var response: String = ""
    @State private var btnPressed = false
    
    var body: some View {
        VStack {
            Spacer()
            HighlightedTextEdit(response: $response, colour: Color.writingGames)
            Spacer()
            ShareAndSaveWriting(saveText: response, shareText: "My hooky first sentence: \(response)", appStorageKey: GameTypes.firstSentence.getAppStorageName())
            Spacer()
        }
        .padding()
        .navigationTitle(GameTypes.firstSentence.getTitle())
    }
}
