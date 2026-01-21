//
//  SplitWordGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct SplitWordGame: View {
    @AppStorage(GameTypes.buildAWord.getAppStorageName()) var topScore: Int = 0
    
    @State var gameState: GameState = .loading
    @State var hearts = 3
    @State var total = 0
    @State var word = GamesGlobalVariables.vocabMap.shuffled().first
    
    var body: some View {
        switch gameState {
        case .loading:
            LoadingPage(title: GameTypes.buildAWord.getTitle(), subtitle: "Build a word from its meaning to improve your vocabulary.", colour: Color.timedGames, icon: GameTypes.buildAWord.getIcon(), action: { gameState = .playing })
        case .playing:
            VStack(spacing: 8) {
                LivesAndScore(hearts: $hearts, total: $total, action: { gameState = .end })
                Spacer()
                SplitWordQuestionPane(word: word, action: {
                    word = GamesGlobalVariables.vocabMap.shuffled().first
                    return SplitWordGame.splitIntoThreeCharacterStrings(word?.0 ?? "")
                })
                Spacer()
                HStack {
                    Text("Your best score: \(topScore)")
                        .font(Font.custom("Bellefair-Regular", size: 12))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
            .padding()
            .navigationTitle(GameTypes.vocabGame.getTitle())
        case .end:
            EndPage(subtitle: "You're out of hearts!", colour: Color.timedGames, icon: GameTypes.vocabGame.getIcon(), score: total, bestScore: topScore, action: {
                hearts = 3
                total = 0
                gameState = .playing
            })
        }
    }
    
    static func splitIntoThreeCharacterStrings(_ word: String) -> [String] {
        var result: [String] = []
        var currentIndex = word.startIndex

        while currentIndex < word.endIndex {
            let nextIndex = word.index(currentIndex, offsetBy: 3, limitedBy: word.endIndex) ?? word.endIndex
            result.append(String(word[currentIndex..<nextIndex]))
            currentIndex = nextIndex
        }
        result = result.shuffled()

        return result
    }
}
