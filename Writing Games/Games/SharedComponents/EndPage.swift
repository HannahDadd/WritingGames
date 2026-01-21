//
//  EndPage.swift
//  Writing Games
//
//  Created by Hannah Dadd on 20/01/2026.
//

import SwiftUI

struct EndPage: View {
    let subtitle: String
    let colour: Color
    let icon: String
    let score: Int
    let bestScore: Int
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: icon)
                .font(.system(size: 60))
                .foregroundColor(Color.black)
            VStack(spacing: 8) {
                Text("Game over")
                    .font(Font.custom("AbrilFatface-Regular", size: 48))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Text(subtitle)
                    .font(Font.custom("Bellefair-Regular", size: 20))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
            }
            if score > bestScore {
                Text("New best score: **\(score)**")
                    .font(Font.custom("Bellefair-Regular", size: 24))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
            } else {
                Text("Score: **\(score)**")
                    .font(Font.custom("Bellefair-Regular", size: 24))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Text("Your best score: **\(bestScore)**")
                    .font(Font.custom("Bellefair-Regular", size: 20))
                    .multilineTextAlignment(.center)
            }
            Spacer()
            GameButton(text: "Play Again", action: action)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colour)
    }
}
