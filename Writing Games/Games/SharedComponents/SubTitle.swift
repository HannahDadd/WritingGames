//
//  SubTitle.swift
//  Writing Games
//
//  Created by Hannah Dadd on 19/01/2026.
//

import SwiftUI

struct SubTitle: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(Font.custom("AbrilFatface-Regular", size: 34))
            Text(subtitle)
                .multilineTextAlignment(.leading)
                .font(.headline)
            VStack {
                EmptyView()
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 16)
    }
}
