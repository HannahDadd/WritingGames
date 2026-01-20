//
//  Excerpt.swift
//  Writing Games
//
//  Created by Hannah Dadd on 20/01/2026.
//

import SwiftUI

struct Excerpt: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(Font.custom("Bellefair-Regular", size: 14))
            .multilineTextAlignment(.leading)
            .lineSpacing(8)
    }
}
