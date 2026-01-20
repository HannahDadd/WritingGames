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
            GameButton(text: "Share", action: {
            })
            Spacer()
        }
        .padding()
        .navigationTitle(GameTypes.firstSentence.getTitle())
    }
}
