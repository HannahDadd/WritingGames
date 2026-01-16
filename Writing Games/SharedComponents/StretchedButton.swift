//
//  StretchedButton.swift
//  Get It Write
//
//  Created by Hannah Dadd on 15/08/2025.
//

import SwiftUI

struct StretchedButton: View {
    var text: String
    var action: () -> Void
    var size: CGFloat = 50
    var isGrey = false
    
    var body : some View {
        Button(action: {
            self.action()
        }) {
            Text(text)
                .font(.headline)
                .frame(minWidth: 0, maxWidth: .infinity)
//                .foregroundColor(Color.onPrimary)
                .padding()
//                .foregroundColor(Color.onPrimary)
//                .background(isGrey ? .gray : Color.primary)
                .overlay(RoundedRectangle(cornerRadius: 5))
        }.accentColor(Color.clear)
    }
}
