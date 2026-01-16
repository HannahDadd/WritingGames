//
//  Prompts.swift
//  Get It Write
//
//  Created by Hannah Dadd on 20/10/2025.
//

import SwiftUI

struct PromptsCTA: View {
    let p = GamesGlobalVariables.writingPrompts.randomElement() ?? ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Writing Prompt of the Day")
                .multilineTextAlignment(.leading)
                .textCase(.uppercase)
            PromptCard(question: p)
        }
    }
}
