//
//  HighScorePromo.swift
//  Writing Games
//
//  Created by Hannah Dadd on 22/01/2026.
//

import SwiftUI

struct HighScorePromo: View {
    @AppStorage(GameTypes.grammar.getAppStorageName()) var grammarTopScore: Int = 0
    @AppStorage(GameTypes.passiveToActive.getAppStorageName()) var passiveToActiveTopScore: Int = 0
    @AppStorage(GameTypes.buildAWord.getAppStorageName()) var splitWordTopScore: Int = 0
    @AppStorage(GameTypes.vocabGame.getAppStorageName()) var vocabTopScore: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("hi").foregroundColor(.white)
                AnyView {
                    getScore(score: grammarTopScore, gameName: GameTypes.grammar.getTitle())
                }
                Spacer()
                AnyView {
                    getScore(score: passiveToActiveTopScore, gameName: GameTypes.passiveToActive.getTitle())
                }
            }
            Spacer()
            HStack {
                AnyView {
                    getScore(score: splitWordTopScore, gameName: GameTypes.buildAWord.getTitle())
                }
                Spacer()
                AnyView {
                    getScore(score: vocabTopScore, gameName: GameTypes.vocabGame.getTitle())
                }
            }
//            VStack {
//                EmptyView()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
        .frame(height: 300)
        .frame(maxWidth: .infinity)
        .background(Color.GetItWriteCTA)
        .cornerRadius(8)
        .padding(.top, 24)
    }
    
    func getScore(score: Int, gameName: String) -> any View {
        VStack {
            Text("hi").foregroundColor(.white)
            Text(gameName)
                .font(Font.custom("Bellefair-Regular", size: 12))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            Text("\(score)")
                .font(Font.custom("AbrilFatface-Regular", size: 18))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
        }
    }
}
