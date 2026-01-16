//
//  VocabCTA.swift
//  Get It Write
//
//  Created by Hannah Dadd on 20/10/2025.
//

import SwiftUI

struct VocabCTA: View {
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Test your vocabulary!")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Spacer()
                Text("Play a game of matchy matchy.")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding()
        }
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .cornerRadius(8)
        .onTapGesture {
            action()
        }
    }
}
