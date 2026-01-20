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
    
    var nextCard: () -> Void
    
    init(showError: Bool = false, showCorrect: Bool = false, word: String, definition: String, options: [String], nextCard: @escaping () -> Void) {
        let o = options + [definition]
        self.showError = showError
        self.showCorrect = showCorrect
        self.word = word
        self.definition = definition
        self.options = o.shuffled()
        self.nextCard = nextCard
    }
    
    var body: some View {
        VStack {
            Text("What does **\(word)** mean?")
            ForEach(options, id: \.self) { o in
                VStack(alignment: .leading) {
                    Text(o)
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .cornerRadius(8)
                .onTapGesture {
                    if o == definition {
                        showCorrect.toggle()
                    } else {
                        showError.toggle()
                    }
                }
            }
            .alert("Not quite! Try again", isPresented: $showError) {
                Button("Close", role: .cancel) { }
            }
            .alert("You got it!", isPresented: $showCorrect) {
                Button("Close", role: .cancel) {
                    nextCard()
                }
            }
        }
    }
    
    func popUp(text: String, onButtonPress: @escaping () -> Void) -> some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.headline)
                .foregroundColor(Color.black)
                .bold()
                .multilineTextAlignment(.leading)
            GameButton(text: "Try Again", action: onButtonPress)
        }
        .padding()
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(8)
    }
}
