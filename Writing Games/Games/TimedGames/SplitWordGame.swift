//
//  SplitWordGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct SplitWordGame: View {
    @State var word = GamesGlobalVariables.vocabMap.shuffled().first
    @State var chosenWords: [String] = []
    var action: () -> Void
    @State var playing = false
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.buildAWord.getTitle(), subtitle: "Build a word from its meaning to improve your vocabulary.", colour: Color.timedGames, icon: GameTypes.buildAWord.getIcon(), action: { playing = true })
        } else {
            VStack {
                Spacer()
                Text(word?.1 ?? "")
                Spacer()
                ForEach(chosenWords, id: \.self) { w in
                    Text(w)
                        .clipShape(Capsule())
                }
                Spacer()
                ForEach(splitIntoThreeCharacterStrings(word?.0 ?? ""), id: \.self) { word in
                    Text(word)
                        .clipShape(Capsule())
                        .onTapGesture {
                            chosenWords.append(word)
                        }
                }
                Spacer()
                GameButton(text: "Done", action: action)
            }
            .padding()
        }
    }
    
    func splitIntoThreeCharacterStrings(_ word: String) -> [String] {
        var result: [String] = []
        var currentIndex = word.startIndex

        while currentIndex < word.endIndex {
            let nextIndex = word.index(currentIndex, offsetBy: 3, limitedBy: word.endIndex) ?? word.endIndex
            result.append(String(word[currentIndex..<nextIndex]))
            currentIndex = nextIndex
        }

        return result
    }
}
