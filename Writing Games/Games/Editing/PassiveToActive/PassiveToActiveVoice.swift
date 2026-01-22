//
//  PassiveToActiveVoice.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct PassiveToActiveGame: View {
    @AppStorage(GameTypes.passiveToActive.getAppStorageName()) var topScore: Int = 0
    
    @State var gameState: GameState = .loading
    @State var hearts = 3
    @State var total = 0
    
    var body: some View {
        switch gameState {
        case .loading:
            LoadingPage(title: GameTypes.passiveToActive.getTitle(), subtitle: "Can you bring theses sentences from the passive to the active voice?", colour: Color.editingGames, icon: GameTypes.passiveToActive.getIcon(), action: { gameState = .playing })
        case .playing:
            VStack(spacing: 8) {
                LivesAndScore(hearts: $hearts, total: $total, action: { gameState = .end })
                Spacer()
                PassiveToActiveQuestionPane(onCorrect: {
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
            .navigationTitle(GameTypes.passiveToActive.getTitle())
        case .end:
            EndPage(subtitle: "You're out of hearts!", colour: Color.editingGames, icon: GameTypes.passiveToActive.getIcon(), score: total, bestScore: topScore, action: {
                hearts = 3
                total = 0
                gameState = .playing
            })
        }
    }
}
