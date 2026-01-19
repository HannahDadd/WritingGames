//
//  RectangleCTA.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct RectangleCTA: View {
    let title: String
    let colour: Color
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font.custom("Bellefair-Regular", size: 18))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
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
