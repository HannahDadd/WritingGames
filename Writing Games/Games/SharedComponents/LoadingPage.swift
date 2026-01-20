//
//  LoadingPage.swift
//  Writing Games
//
//  Created by Hannah Dadd on 19/01/2026.
//

import SwiftUI

struct LoadingPage: View {
    let title: String
    let subtitle: String
    let colour: Color
    let icon: String
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: icon)
                .font(.system(size: 60))
                .foregroundColor(Color.black)
            Text(title)
                .font(Font.custom("AbrilFatface-Regular", size: 48))
                .foregroundColor(Color.black)
            Text(subtitle)
                .font(Font.custom("Bellefair-Regular", size: 24))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            Spacer()
            GameButton(text: "Play", action: action)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colour)
    }
}
