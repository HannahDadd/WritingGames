//
//  GenreMashUp.swift
//  Writing Games
//
//  Created by Hannah Dadd on 18/01/2026.
//

import SwiftUI

struct GenreGame: View {
    @State var response: String = ""
    @State private var btnPressed = false
    let e = GamesGlobalVariables.excerts.randomElement()
    let genre = GamesGlobalVariables.grammarSentences.shuffled().first!
    @State var playing = false
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.genre.getTitle(), subtitle: "Give this excerpt a new genre!", colour: Color.writingGames, icon: GameTypes.genre.getIcon(), action: { playing = true })
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Change the genre of this excerpt to **\(genre)**")
                    Text(e?.0 ?? "")
                    TextEditor(text: $response)
                        .frame(height: 100, alignment: .leading)
                        .cornerRadius(6.0)
                        .border(Color.gray, width: 1)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    GameButton(text: btnPressed ? "Congrats!" : "I did the prompt!", action: {
                        btnPressed = true
                    })
                }.padding()
            }
        }
    }
}
