//
//  SplitWordGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct SplitWordGame: View {
    @State var word = GamesGlobalVariables.vocabMap.shuffled().first
    var action: () -> Void
    
    var body: some View {
        VStack {
            VocabQuestion(word: word?.key ?? "", definition: word?.value ?? "", options: fakeWords, nextCard: {
                word = GamesGlobalVariables.vocabMap.shuffled().first
                fakeWords = GamesGlobalVariables.vocabMap.shuffled().prefix(3).compactMap { $0.value }
            })
            Spacer()
            StretchedButton(text: "Done", action: action)
        }
        .padding()
    }
}
