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
    let excerpt = GamesGlobalVariables.excerts.randomElement()
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.povSwitch.getTitle(), subtitle: "Switch up the point of view of this excerpt.", colour: Color.writingGames, icon: GameTypes.povSwitch.getIcon(), action: { playing = true })
        } else {
            ScrollView {
                VStack(spacing: 18) {
                    Excerpt(text: excerpt?.0 ?? "")
                    Text("Rewrite excerpt in the point of view of:")
                    HighlightedText(colour: Color.writingGames, words: excerpt?.1.uppercased() ?? "")
                    WritingEditor(words: $response)
                    Spacer()
                    ShareAndSaveWriting(saveText: response, shareText: "I rewrote this excerpt \(excerpt?.0 ?? "") \n From the persepctive of \(excerpt?.1 ?? ""): \(response)", appStorageKey: GameTypes.povSwitch.getAppStorageName())
                }
                .padding()
                .navigationTitle(GameTypes.povSwitch.getTitle())
            }
        }
    }
}
