//
//  ReplaceWordVide.swift
//  Get It Write
//
//  Created by Hannah Dadd on 21/10/2025.
//

import SwiftUI

struct CutTheWaffle: View {
    @State var response: String = ""
    let sentence = GamesGlobalVariables.badSentences.randomElement()!
    var back: () -> Void
    @State var playing = false
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.editingGame.getTitle(), subtitle: "These sentences along, what words can you cut?", colour: Color.timedGames, icon: GameTypes.editingGame.getIcon(), action: { playing = true })
        } else {
            VStack(alignment: .leading, spacing: 24) {
                Text("Rewrite the sentence below to practice your editing skills.")
                Text(sentence).bold()
                TextEditor(text: $response)
                    .frame(height: 100, alignment: .leading)
                    .cornerRadius(6.0)
                    .border(Color.gray, width: 1)
                    .multilineTextAlignment(.leading)
                Spacer()
                ShareLink(item: "I got this sentence on the Get It Write app: \(sentence)\nThis is my edit: \(response)", message: Text("Thoughts?"))
                StretchedButton(text: "Done", action: back)
            }
            .padding()
        }
    }
}
