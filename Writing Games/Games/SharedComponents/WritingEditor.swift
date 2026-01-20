//
//  WritingEditor.swift
//  Writing Games
//
//  Created by Hannah Dadd on 20/01/2026.
//

import SwiftUI

struct WritingEditor: View {
    @Binding var words: String
    let placeholder: String = "Write story here..."
    
    var body: some View {
        TextEditor(text: $words)
            .lineSpacing(5)
            .overlay {
                if words.isEmpty {
                    VStack {
                        HStack {
                            Text(placeholder)
                                .padding(4)
                                .padding(.top, 4)
                            Spacer()
                        }
                        Spacer()
                    }
                    .allowsHitTesting(false)
                }
            }
    }
}
