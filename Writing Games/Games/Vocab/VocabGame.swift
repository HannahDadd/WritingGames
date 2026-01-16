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
