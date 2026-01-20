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
    @State var playing = false
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.povSwitch.getTitle(), subtitle: "Switch up the point of view of this excerpt.", colour: Color.writingGames, icon: GameTypes.povSwitch.getIcon(), action: { playing = true })
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Change the POV of this excerpt to **\(e?.1 ?? "")**")
                    Text(e?.0 ?? "")
                    TextEditor(text: $response)
                        .frame(height: 100, alignment: .leading)
                        .cornerRadius(6.0)
                        .border(Color.gray, width: 1)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    GameButton(text: btnPressed ? "Congrats!" : "I did the prompt!", action: {
                        btnPressed = true
                    })
                }.padding()
            }
        }
    }
}
