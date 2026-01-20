//
//  VocabSpace.swift
//  Writing Games
//
//  Created by Hannah Dadd on 20/01/2026.
//

import SwiftUI

struct LivesAndScore: View {
    @Binding var hearts: Int
    @Binding var total: Int
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text("Score: **\(total)**")
            Spacer()
            if hearts > 0 {
                ForEach(0..<hearts, id: \.self) { _ in
                    Image(systemName: "heart.fill")
                }
            } else {
                Text("")
                    .onAppear { action() }
            }
        }
    }
}
