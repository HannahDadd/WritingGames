//
//  Card.swift
//  Get It Write
//
//  Created by Hannah Dadd on 20/10/2025.
//

import SwiftUI

struct PromptCard: View {
    let question: String
    
    var body: some View {
        NavigationLink(
            destination:
                ExpandedPrompt(question: question)) {
                    VStack(alignment: .leading) {
                        Text(question)
                            .font(.headline)
//                            .foregroundColor(Color.onCardBackground)
                            .bold()
                            .lineLimit(3)
                    }
                    .padding()
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
//                    .background(Color.cardBackground)
                    .cornerRadius(8)
                }
    }
}
