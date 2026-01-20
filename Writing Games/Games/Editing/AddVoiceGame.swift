//
//  AddVoiceGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct AddVoiceGame: View {
    @State var response: String = ""
    let sentence = GamesGlobalVariables.dialogue.randomElement()!
    let tone = GamesGlobalVariables.tones.randomElement()!
    var back: () -> Void
    @State var playing = false
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.addVoice.getTitle(), subtitle: "Can you give personality to these bland dialogue tags?", colour: Color.editingGames, icon: GameTypes.addVoice.getIcon(), action: { playing = true })
        } else {
            VStack(alignment: .leading, spacing: 24) {
                Text("Rewrite the dialogue below with the following tone **\(tone)**.")
                Text(sentence).bold()
                TextEditor(text: $response)
                    .frame(height: 100, alignment: .leading)
                    .cornerRadius(6.0)
                    .border(Color.gray, width: 1)
                    .multilineTextAlignment(.leading)
                Spacer()
                ShareLink(item: "I got this sentence on the Get It Write app: \(sentence)\nThis is my edit: \(response)", message: Text("Thoughts?"))
                GameButton(text: "Done", action: back)
            }
            .padding()
        }
    }
}
