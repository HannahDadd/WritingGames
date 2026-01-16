//
//  ExpandedPrompt.swift
//  Get It Write
//
//  Created by Hannah Dadd on 24/10/2025.
//

import SwiftUI

struct ExpandedPrompt: View {
    @State private var btnPressed = false
    let question: String
    
    var body: some View {
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
