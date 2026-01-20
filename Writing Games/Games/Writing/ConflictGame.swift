//
//  ConflictGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 18/01/2026.
//

import SwiftUI

struct ConflictGame: View {
    @State var response: String = ""
    @State private var btnPressed = false
    let c = GamesGlobalVariables.characterSituations.randomElement() ?? ""
    @State var playing = false
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.conflict.getTitle(), subtitle: "This character is in a sticky situation, can you get them out of it?", colour: Color.timedGames, icon: GameTypes.conflict.getIcon(), action: { playing = true })
        } else {
            VStack(alignment: .leading) {
                Text("Write the character out of this situation")
                Text(c)
                TextEditor(text: $response)
                    .frame(height: 100, alignment: .leading)
                    .cornerRadius(6.0)
                    .border(Color.gray, width: 1)
                    .multilineTextAlignment(.leading)
                Spacer()
                StretchedButton(text: btnPressed ? "Congrats!" : "I did the prompt!", action: {
                    btnPressed = true
                })
            }.padding()
        }
    }
}
