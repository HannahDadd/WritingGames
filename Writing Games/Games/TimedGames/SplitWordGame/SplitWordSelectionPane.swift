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
    
    let word: [String: String].Element?
    let action: () -> [String]
    
    let onCorrect: () -> Void
    let onIncorrect: () -> Void
    
    init(word: [String : String].Element?, action: @escaping () -> [String], onCorrect: @escaping () -> Void, onIncorrect: @escaping () -> Void) {
        self.word = word
        self.action = action
        self.splitWords = SplitWordGame.splitIntoThreeCharacterStrings(word?.0 ?? "")
        self.onCorrect = onCorrect
        self.onIncorrect = onIncorrect
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text(word?.1 ?? "")
                .multilineTextAlignment(.center)
            Spacer()
            HStack(spacing: 4) {
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
        .alert("Not quite! Try again", isPresented: $showError) {
            Button("Close", role: .cancel) {
                onIncorrect()
            }
        }
        .alert("You got it!", isPresented: $showCorrect) {
            Button("Close", role: .cancel) {
                onCorrect()
                chosenWords = []
                splitWords = action()
            }
        }
    }
}
