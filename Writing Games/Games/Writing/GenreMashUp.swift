//
//  GenreMashUp.swift
//  Writing Games
//
//  Created by Hannah Dadd on 18/01/2026.
//

import SwiftUI

struct GenreGame: View {
    @State var playing = false
    @State var response: String = ""
    
    let excerpt = GamesGlobalVariables.excerts.randomElement()
    let genre = GamesGlobalVariables.genres.shuffled().first
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.genre.getTitle(), subtitle: "Give this excerpt a new genre!", colour: Color.writingGames, icon: GameTypes.genre.getIcon(), action: { playing = true })
        } else {
            ScrollView {
                VStack(spacing: 18) {
                    Excerpt(text: excerpt?.0 ?? "")
                    Text("Rewrite excerpt in the genre of:")
                    HighlightedText(colour: Color.writingGames, words: genre ?? "")
                    WritingEditor(words: $response)
                    Spacer()
                    ShareAndSaveWriting(saveText: response, shareText: "I rewrote this excerpt \(excerpt?.0 ?? "") \nIn the genre of \(genre ?? ""): \(response)", appStorageKey: GameTypes.genre.getAppStorageName())
                }
                .padding()
                .navigationTitle(GameTypes.genre.getTitle())
            }
        }
    }
}
