//
//  VocabGame.swift
//  Get It Write
//
//  Created by Hannah Dadd on 21/10/2025.
//

import SwiftUI

struct VocabGame: View {
    @AppStorage(GameTypes.vocabGame.getAppStorageName()) var topScore: Int = 0
    
    @State var playing = false
    @State var showEnd = false
    @State var hearts = 3
    @State var total = 0

    @State var word = GamesGlobalVariables.vocabMap.shuffled().first
    @State var fakeWords = GamesGlobalVariables.vocabMap.shuffled().prefix(3).compactMap { $0.value }
    
    var body: some View {
        if !playing {
            LoadingPage(title: GameTypes.vocabGame.getTitle(), subtitle: "Pick the correct meaning of these niche words to improve your vocabulary.", colour: Color.timedGames, icon: GameTypes.vocabGame.getIcon(), action: { playing = true })
        } else if showEnd {
            EndPage(subtitle: "You're out of hearts!", colour: Color.timedGames, icon: GameTypes.vocabGame.getIcon(), score: total, bestScore: topScore, action: {
                showEnd = false
                playing = true
            })
        } else {
            VStack(spacing: 8) {
                LivesAndScore(hearts: $hearts, total: $total, showEnd: $showEnd)
                Spacer()
                VocabQuestion(word: word?.key ?? "", definition: word?.value ?? "", options: fakeWords, onCorrect: {
                    total = total + 1
                    if total > topScore {
                        topScore = total
                    }
                    word = GamesGlobalVariables.vocabMap.shuffled().first
                    fakeWords = GamesGlobalVariables.vocabMap.shuffled().prefix(3).compactMap { $0.value }
                }, onIncorrect: {
                    hearts = hearts - 1
                })
                Spacer()
            }
            .padding()
            .navigationTitle(GameTypes.vocabGame.getTitle())
        }
    }
}
