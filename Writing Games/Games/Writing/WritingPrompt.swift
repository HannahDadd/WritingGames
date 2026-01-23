//
//  ExpandedPrompt.swift
//  Get It Write
//
//  Created by Hannah Dadd on 24/10/2025.
//

import SwiftUI

struct WritingPrompt: View {
    @State var playing = false
    @State var response = ""
    @State private var btnPressed = false
    let prompt = GamesGlobalVariables.writingPrompts.randomElement() ?? ""
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.prompt.getTitle(), subtitle: "Feeling inspired? Write a short story from this prompt.", colour: Color.writingGames, icon: GameTypes.prompt.getIcon(), action: { playing = true })
        } else {
            VStack(spacing: 8) {
                HighlightedText(colour: Color.writingGames, words: prompt)
                WritingEditor(words: $response)
                Spacer()
                ShareAndSaveWriting(saveText: response, shareText: "From this prompt: \(prompt) \n I wrote this story: \(response)", appStorageKey: GameTypes.prompt.getAppStorageName())
            }
            .padding()
            .navigationTitle(GameTypes.prompt.getTitle())
        }
    }
}
