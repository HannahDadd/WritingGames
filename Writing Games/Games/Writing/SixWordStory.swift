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
        VStack {
            Spacer()
            HighlightedTextEdit(response: $response, colour: Color.writingGames)
            Spacer()
            ShareAndSaveWriting(saveText: response, shareText: "My six word story: \(response)", appStorageKey: GameTypes.sixWordStory.getAppStorageName())
            Spacer()
        }
        .padding()
        .navigationTitle(GameTypes.sixWordStory.getTitle())
    }
}
