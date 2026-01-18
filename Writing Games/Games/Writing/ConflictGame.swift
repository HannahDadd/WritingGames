//
//  ConflictGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 18/01/2026.
//

import SwiftUI

struct ConflictGame: View {
    @State var response: String = ""
    @State private var btnPressed = false
    let c = GamesGlobalVariables.characterSituations.randomElement() ?? ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Write the character out of this situation")
            Text(c)
            TextEditor(text: $response)
                .frame(height: 100, alignment: .leading)
                .cornerRadius(6.0)
                .border(Color.gray, width: 1)
                .multilineTextAlignment(.leading)
            Spacer()
            StretchedButton(text: btnPressed ? "Congrats!" : "I did the prompt!", action: {
                btnPressed = true
            })
        }.padding()
    }
}
