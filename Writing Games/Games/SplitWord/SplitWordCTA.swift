//
//  SplitWordCTA.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct SplitWordCTA: View {
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Practice editing")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Spacer()
                Text("Practice your editing skills on these sentences.")
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
