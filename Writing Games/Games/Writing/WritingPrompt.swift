//
//  ExpandedPrompt.swift
//  Get It Write
//
//  Created by Hannah Dadd on 24/10/2025.
//

import SwiftUI

struct WritingPrompt: View {
    @State private var btnPressed = false
    let question = GamesGlobalVariables.writingPrompts.randomElement() ?? ""
    @State var playing = false
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.prompt.getTitle(), subtitle: "Feeling inspired? Write a short story from this prompt.", colour: Color.timedGames, icon: GameTypes.prompt.getIcon(), action: { playing = true })
        } else {
            VStack(alignment: .leading) {
                Text(question)
                Spacer()
                Text(btnPressed ? "" : "Did you do this prompt? Tell us!")
                StretchedButton(text: btnPressed ? "Congrats!" : "I did the prompt!", action: {
                    btnPressed = true
                })
            }.padding()
        }
    }
}
