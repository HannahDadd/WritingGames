//
//  SplitWordSelectionPane.swift
//  Writing Games
//
//  Created by Hannah Dadd on 21/01/2026.
//

import SwiftUI

struct SplitWordQuestionPane: View {
    let word: [String: String].Element?
    var action: () -> [String]
    @State var chosenWords: [String] = []
    @State var splitWords: [String]
    
    init(word: [String : String].Element?, action: @escaping () -> [String]) {
        self.word = word
        self.action = action
        self.splitWords = SplitWordGame.splitIntoThreeCharacterStrings(word?.0 ?? "")
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text(word?.1 ?? "")
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                ForEach(chosenWords, id: \.self) { w in
                    Text(w)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Capsule(style: .circular))
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
                chosenWords = []
                splitWords = action()
            })
        }
        .padding()
    }
}
