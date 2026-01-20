//
//  GetItWriteCTA.swift
//  Writing Games
//
//  Created by Hannah Dadd on 20/01/2026.
//

import SwiftUI

struct GetItWriteCTA: View {
    @State private var showingPopover = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("")
                .font(Font.custom("Bellefair-Regular", size: 18))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            Spacer()
            Text("")
                .font(Font.custom("Bellefair-Regular", size: 18))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            VStack {
                EmptyView()
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .background(Color.GetItWriteCTA)
        .cornerRadius(8)
        .onTapGesture {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            Text("Your content here")
                .font(.headline)
                .padding()
        }
    }
}
