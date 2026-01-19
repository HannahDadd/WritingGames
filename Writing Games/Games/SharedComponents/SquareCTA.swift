//
//  SquareCTA.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct SquareCTA: View {
    let title: String
    let colour: Color
    let icon: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: icon)
                .font(.system(size: 45))
                .foregroundColor(Color.white)
            Spacer()
            Text(title)
                .font(Font.custom("AbrilFatface-Regular", size: 18))
                .foregroundColor(Color.white)
            VStack {
                EmptyView()
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .background(colour)
        .cornerRadius(8)
        .onTapGesture {
            action()
        }
    }
}
