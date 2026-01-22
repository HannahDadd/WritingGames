//
//  HighScorePromo.swift
//  Writing Games
//
//  Created by Hannah Dadd on 22/01/2026.
//

import SwiftUI
import Charts

struct HighScorePromo: View {
    @AppStorage(GameTypes.grammar.getAppStorageName()) var grammarTopScore: Int = 0
    @AppStorage(GameTypes.passiveToActive.getAppStorageName()) var passiveToActiveTopScore: Int = 0
    @AppStorage(GameTypes.buildAWord.getAppStorageName()) var splitWordTopScore: Int = 0
    @AppStorage(GameTypes.vocabGame.getAppStorageName()) var vocabTopScore: Int = 0
    
    var body: some View {
        if grammarTopScore == 0, passiveToActiveTopScore == 0, splitWordTopScore == 0, vocabTopScore == 0 {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 8) {
                SubTitle(title: "Your Top Scores")
                Chart {
                    BarMark(
                        x: .value("Score", grammarTopScore),
                        y: .value("Game", GameTypes.grammar.getTitle())
                    )
                    BarMark(
                        x: .value("Score", passiveToActiveTopScore),
                        y: .value("Game", GameTypes.passiveToActive.getTitle())
                    )
                    BarMark(
                        x: .value("Score", splitWordTopScore),
                        y: .value("Game", GameTypes.buildAWord.getTitle())
                    )
                    BarMark(
                        x: .value("Score", vocabTopScore),
                        y: .value("Game", GameTypes.vocabGame.getTitle())
                    )
                }
                .chartXAxis {
                    AxisMarks {
                        AxisValueLabel()
                    }
                }
                .chartYAxis {
                    AxisMarks {
                        AxisValueLabel()
                    }
                }
                .foregroundStyle(Color.GetItWriteCTA)
            }
            .frame(height: 300)
        }
    }
}
