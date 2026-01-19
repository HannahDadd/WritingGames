//
//  RectangleCTA.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct RectangleCTA: View {
    let title: String
    let subtitle: String
    let colour: Color
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Spacer()
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding()
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(colour)
        .cornerRadius(8)
        .onTapGesture {
            action()
        }
    }
}
