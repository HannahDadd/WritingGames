//
//  VocabGame.swift
//  Get It Write
//
//  Created by Hannah Dadd on 21/10/2025.
//

import SwiftUI

struct VocabGame: View {
    @State var word = GamesGlobalVariables.vocabMap.shuffled().first
    @State var fakeWords = GamesGlobalVariables.vocabMap.shuffled().prefix(3).compactMap { $0.value }
    @State var playing = false
    var action: () -> Void
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.vocabGame.getTitle(), subtitle: "", colour: Color.timedGames, icon: GameTypes.vocabGame.getIcon(), action: { playing = true })
        } else {
            VStack {
                VocabQuestion(word: word?.key ?? "", definition: word?.value ?? "", options: fakeWords, nextCard: {
                    word = GamesGlobalVariables.vocabMap.shuffled().first
                    fakeWords = GamesGlobalVariables.vocabMap.shuffled().prefix(3).compactMap { $0.value }
                })
                Spacer()
                StretchedButton(text: "Done", action: action)
            }
            .padding()
            .navigationTitle("List with Navigation")
        }
    }
}
