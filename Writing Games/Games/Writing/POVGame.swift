//
//  POVGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 18/01/2026.
//

import SwiftUI

struct POVGame: View {
    @State var playing = false
    @State var response: String = ""
    let e = GamesGlobalVariables.excerts.randomElement()
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.povSwitch.getTitle(), subtitle: "Switch up the point of view of this excerpt.", colour: Color.writingGames, icon: GameTypes.povSwitch.getIcon(), action: { playing = true })
        } else {
            ScrollView {
                VStack(spacing: 18) {
                    Excerpt(text: e?.0 ?? "")
                    Text("Rewrite excerpt in the point of view of:")
                    HighlightedText(colour: Color.writingGames, words: e?.1.uppercased() ?? "")
                    WritingEditor(words: $response)
                    Spacer()
                    GameButton(text: "Share", action: {
                    })
                }
                .padding()
                .navigationTitle(GameTypes.povSwitch.getTitle())
            }
        }
    }
}
