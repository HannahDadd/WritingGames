//
//  SplitWordSelectionPane.swift
//  Writing Games
//
//  Created by Hannah Dadd on 21/01/2026.
//

import SwiftUI

struct SplitWordQuestionPane: View {
    @State private var showError = false
    @State private var showCorrect = false
    @State var chosenWords: [String] = []
    @State var splitWords: [String]
    @State var word: [String: String].Element?
    
    let onCorrect: () -> Void
    let onIncorrect: () -> Void
    
    init(onCorrect: @escaping () -> Void, onIncorrect: @escaping () -> Void) {
        let startingWord = GamesGlobalVariables.vocabMap.shuffled().first
        self.splitWords = SplitWordQuestionPane.splitIntoThreeCharacterStrings(startingWord?.0 ?? "")
        self.word = startingWord
        self.onCorrect = onCorrect
        self.onIncorrect = onIncorrect
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text(word?.1 ?? "")
                .multilineTextAlignment(.center)
            Spacer()
            HStack(spacing: 2) {
                ForEach(chosenWords, id: \.self) { w in
                    Text(w)
                        .onTapGesture {
                            splitWords.append(w)
                            chosenWords = chosenWords.filter { w != $0 }
                        }
                }
            }
            Spacer()
            HStack {
                ForEach(splitWords, id: \.self) { word in
                    Text(word)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Capsule(style: .circular))
                        .onTapGesture {
                            chosenWords.append(word)
                            splitWords = splitWords.filter { word != $0 }
                        }
                }
            }
            Spacer()
            GameButton(text: "Done", action: {
                let answer = chosenWords.joined()
                if answer == word?.0 ?? "" {
                    showCorrect = true
                } else {
                    showError = true
                }
            })
        }
        .padding()
        .alert("Not quite! It was \(word?.0 ?? "")", isPresented: $showError) {
            Button("Close", role: .cancel) {
                onIncorrect()
                word = GamesGlobalVariables.vocabMap.shuffled().first
                chosenWords = []
                splitWords = SplitWordQuestionPane.splitIntoThreeCharacterStrings(word?.0 ?? "")
            }
        }
        .alert("You got it!", isPresented: $showCorrect) {
            Button("Close", role: .cancel) {
                onCorrect()
                word = GamesGlobalVariables.vocabMap.shuffled().first
                chosenWords = []
                splitWords = SplitWordQuestionPane.splitIntoThreeCharacterStrings(word?.0 ?? "")
            }
        }
    }
    
    static func splitIntoThreeCharacterStrings(_ word: String) -> [String] {
        var result: [String] = []
        var currentIndex = word.startIndex

        while currentIndex < word.endIndex {
            let nextIndex = word.index(currentIndex, offsetBy: 3, limitedBy: word.endIndex) ?? word.endIndex
            result.append(String(word[currentIndex..<nextIndex]))
            currentIndex = nextIndex
        }
        result = result.shuffled()

        return result
    }
}
