//
//  GrammarGame.swift
//  Writing Games
//
//  Created by Hannah Dadd on 21/01/2026.
//

import SwiftUI

struct GrammarGame: View {
    @AppStorage(GameTypes.grammar.getAppStorageName()) var topScore: Int = 0
    
    @State var gameState: GameState = .loading
    @State var hearts = 3
    @State var total = 0
    
    var body: some View {
        switch gameState {
        case .loading:
            LoadingPage(title: GameTypes.grammar.getTitle(), subtitle: "The grammar in these sentences are all over the place, how many can you fix before the timer runs out?", colour: Color.editingGames, icon: GameTypes.grammar.getIcon(), action: { gameState = .playing })
        case .playing:
            VStack(spacing: 8) {
                LivesAndScore(hearts: $hearts, total: $total, action: { gameState = .end })
                Spacer()
                GrammarGameQuestionPane(onCorrect: {
                    total = total + 1
                    if total > topScore {
                        topScore = total
                    }
                }, onIncorrect: {
                    hearts = hearts - 1
                })
                Spacer()
                HStack {
                    Text("Your best score: \(topScore)")
                        .font(Font.custom("Bellefair-Regular", size: 12))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
            .padding()
            .navigationTitle(GameTypes.grammar.getTitle())
        case .end:
            EndPage(subtitle: "You're out of hearts!", colour: Color.editingGames, icon: GameTypes.grammar.getIcon(), score: total, bestScore: topScore, action: {
                hearts = 3
                total = 0
                gameState = .playing
            })
        }
    }
}
