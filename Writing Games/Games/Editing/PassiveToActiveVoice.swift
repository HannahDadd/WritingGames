//
//  PassiveToActiveVoice.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct PassiveToActiveGame: View {
    @State private var showError = false
    @State private var showCorrect = false
    @State var response: String = ""
    let sentence = GamesGlobalVariables.passiveToActiveMap.shuffled().first!
    var back: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Turn this passive sentence to the active voice:")
            Text(sentence.0).bold()
            TextEditor(text: $response)
                .frame(height: 100, alignment: .leading)
                .cornerRadius(6.0)
                .border(Color.gray, width: 1)
                .multilineTextAlignment(.leading)
            Spacer()
            StretchedButton(text: "Done", action: {
                if sentence.1 == response {
                    showCorrect = true
                } else {
                    showError = false
                }
            })
        }
        .padding()
        .alert("Not quite! Try again", isPresented: $showError) {
            Button("Close", role: .cancel) { }
        }
        .alert("You got it!", isPresented: $showCorrect) {
            Button("Close", role: .cancel) {
                
            }
        }
    }
}
