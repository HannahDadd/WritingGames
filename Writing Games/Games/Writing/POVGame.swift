//
//  POVGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 18/01/2026.
//

import SwiftUI

struct POVGame: View {
    @State var response: String = ""
    @State private var btnPressed = false
    let e = GamesGlobalVariables.excerts.randomElement()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Change the POV of this excerpt to **\(e.1)**")
                Text(e?.0 ?? "")
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
}
