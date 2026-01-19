//
//  HookyFirstSentenceGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 19/01/2026.
//

import SwiftUI

struct HookyFirstSentenceGame: View {
    @State var response: String = ""
    @State private var btnPressed = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Write a hooky first sentence")
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
