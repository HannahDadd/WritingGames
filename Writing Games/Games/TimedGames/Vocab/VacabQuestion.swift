//
//  VacabQuestion.swift
//  Get It Write
//
//  Created by Hannah Dadd on 21/10/2025.
//

import SwiftUI

struct VocabQuestion: View {
    @State private var showError = false
    @State private var showCorrect = false
    
    let word: String
    let definition: String
    let options: [String]
    
    var onCorrect: () -> Void
    var onIncorrect: () -> Void
    
    init(showError: Bool = false, showCorrect: Bool = false, word: String, definition: String, options: [String], onCorrect: @escaping () -> Void, onIncorrect: @escaping () -> Void) {
        let o = options + [definition]
        self.showError = showError
        self.showCorrect = showCorrect
        self.word = word
        self.definition = definition
        self.options = o.shuffled()
        self.onCorrect = onCorrect
        self.onIncorrect = onIncorrect
    }
    
    var body: some View {
        VStack(spacing: 14) {
            Text("What does **\(word)** mean?")
            VStack(spacing: 14) {
                ForEach(options, id: \.self) { o in
                    Button(action: {
                        if o == definition {
                            showCorrect.toggle()
                        } else {
                            showError.toggle()
                        }
                    }) {
                        Text(o)
                            .font(Font.custom("Bellefair-Regular", size: 14))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.gray, lineWidth: 4)
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
            .alert("Not quite! Try again", isPresented: $showError) {
                Button("Close", role: .cancel) {
                    onIncorrect()
                }
            }
            .alert("You got it!", isPresented: $showCorrect) {
                Button("Close", role: .cancel) {
                    onCorrect()
                }
            }
        }
    }
}
