//
//  ContentView.swift
//  Writing Games
//
//  Created by Hannah Dadd on 16/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GamesPage()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                }
            
            SavedWriting()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
        }
    }
}
