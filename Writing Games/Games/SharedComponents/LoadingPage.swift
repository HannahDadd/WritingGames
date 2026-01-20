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
        VStack {
            Spacer()
            Image(systemName: icon)
                .font(.system(size: 45))
                .foregroundColor(Color.white)
            Text(title)
                .font(Font.custom("AbrilFatface-Regular", size: 24))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            Text(subtitle)
                .font(Font.custom("Bellefair-Regular", size: 18))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            Spacer()
            StretchedButton(text: "Play", action: {})
            Spacer()
            VStack {
                EmptyView()
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(colour)
        .cornerRadius(8)
        .onTapGesture {
            action()
        }
    }
}
