//
//  SavedWriting.swift
//  Writing Games
//
//  Created by Hannah Dadd on 22/01/2026.
//

import SwiftUI

struct SavedWriting: View {
    @State var sixWordStorySaved = UserDefaults.standard.array(forKey: GameTypes.sixWordStory.getAppStorageName()) as? [String] ?? []
    @State var conflictSaved = UserDefaults.standard.array(forKey: GameTypes.conflict.getAppStorageName()) as? [String] ?? []
    @State var genreSaved = UserDefaults.standard.array(forKey: GameTypes.genre.getAppStorageName()) as? [String] ?? []
    @State var povSaved = UserDefaults.standard.array(forKey: GameTypes.povSwitch.getAppStorageName()) as? [String] ?? []
    @State var promptSaved = UserDefaults.standard.array(forKey: GameTypes.prompt.getAppStorageName()) as? [String] ?? []
    @State var firstSentenceSaved = UserDefaults.standard.array(forKey: GameTypes.firstSentence.getAppStorageName()) as? [String] ?? []
    
    var body: some View {
        if sixWordStorySaved.isEmpty, conflictSaved.isEmpty, genreSaved.isEmpty, povSaved.isEmpty, promptSaved.isEmpty, firstSentenceSaved.isEmpty {
            VStack(spacing: 24) {
                Spacer()
                Image(systemName: "lock.fill")
                    .font(.system(size: 60))
                Text("Proud of your writing?")
                    .font(Font.custom("AbrilFatface-Regular", size: 32))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Text("Save it! It will appear here.")
                    .font(Font.custom("Bellefair-Regular", size: 24))
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            NavigationStack {
                List {
                    WritingSection(stories: sixWordStorySaved, gameType: GameTypes.sixWordStory)
                    WritingSection(stories: conflictSaved, gameType: GameTypes.conflict)
                    WritingSection(stories: povSaved, gameType: GameTypes.povSwitch)
                    WritingSection(stories: genreSaved, gameType: GameTypes.genre)
                    WritingSection(stories: promptSaved, gameType: GameTypes.prompt)
                    WritingSection(stories: firstSentenceSaved, gameType: GameTypes.firstSentence)
                }
                .navigationTitle("Saved Writing")
            }
        }
    }
}
