//
//  AddVoiceGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct AddVoiceGame: View {
    @State var response: String = ""
    @State var playing = false

    let sentence = GamesGlobalVariables.dialogue.randomElement()!
    let tone = GamesGlobalVariables.tones.randomElement()!
    var back: () -> Void
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.addVoice.getTitle(), subtitle: "Can you give personality to these bland dialogue tags?", colour: Color.editingGames, icon: GameTypes.addVoice.getIcon(), action: { playing = true })
        } else {
            VStack(spacing: 24) {
                Text(sentence)
                    .padding()
                    .background(Color.editingGames)
                    .clipShape(BubbleShape())
                    .foregroundColor(.white)
                Text("Write in the tone: **\(tone)**")
                HighlightedTextEdit(response: $response, colour: Color.editingGames)
                Spacer()
                ShareLink(item: "I got this sentence on the Get It Write app: \(sentence)\nThis is my edit: \(response)", message: Text("Thoughts?"))
                GameButton(text: "Done", action: back)
            }
            .padding()
            .navigationTitle(GameTypes.addVoice.getTitle())
        }
    }
}
