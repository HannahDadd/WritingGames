//
//  SixWordStory.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct SixWordStory: View {
    @State var response: String = ""
    @State private var btnPressed = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Write a six word story")
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
