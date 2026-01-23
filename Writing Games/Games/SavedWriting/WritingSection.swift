//
//  SavedPiece.swift
//  Writing Games
//
//  Created by Hannah Dadd on 23/01/2026.
//

import SwiftUI

struct WritingSection: View {
    @State var deleted = false
    let stories: [String]
    let gameType: GameTypes
    
    var body: some View {
        if stories.isEmpty {
            EmptyView()
        } else {
            NavigationLink(gameType.getTitle()) {
                List(stories, id: \.self) { story in
                    NavigationLink(destination: {
                        ScrollView {
                            VStack(spacing: 24) {
                                Text(story)
                                GameButton(text: deleted ? "Deleted" : "Delete", action: {
                                    if !deleted {
                                        var items = UserDefaults.standard.array(forKey: gameType.getAppStorageName()) as? [String] ?? []
                                        items.removeAll(where: { $0 == story })
                                        UserDefaults.standard.set(items, forKey: gameType.getAppStorageName())
                                        deleted = true
                                    }
                                })
                            }
                            .padding()
                        }
                    }, label: { Text(story).lineLimit(1) })
                }
            }
        }
    }
}
