//
//  GetItWritePromo.swift
//  Writing Games
//
//  Created by Hannah Dadd on 17/02/2026.
//

import SwiftUI

struct OtherAppsPromo: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Image("GetItWritePromo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Download Get it Write")
                .font(Font.custom("AbrilFatface-Regular", size: 34))
                .multilineTextAlignment(.leading)
            Text("""
Ready to write a full length book? Get it Write will gamify your creative writing and get those words written.

Featuring focused writing sprints to help you carve out the time, daily streaks to keep your word count on track, and daily notifications that form a consistent writing habit. Collect achievement badges as you hit author milestones and get detailed stats showing just how consistent you’re becoming.

Whether you’re drafting your first novel in New York, polishing poetry in London, or journaling in the Highlands, the UK is full of storytellers, they just need a place to start. Download Get it Write today, start your first sprint, and get those words written.
""")
                .font(Font.custom("Bellefair-Regular", size: 18))
                .multilineTextAlignment(.leading)
            HStack {
                Spacer()
                GameButton(text: "Download now", action: {
                    if let url = URL(string: "https://apps.apple.com/gb/app/get-it-write/id6471916593") {
                        UIApplication.shared.open(url)
                    }
                })
                Spacer()
            }
            Image("ShelfifyPromo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Download Shelfify")
                .font(Font.custom("AbrilFatface-Regular", size: 34))
                .multilineTextAlignment(.leading)
            Text("""
            Do you want a visual project tracker for your workout?
            
            As your word count climbs, in Shelfify, your once-abandoned library slowly comes back to life, filling with books. Friendly ghosts visit your library with encouraging messages to keep you motivated, while built-in focus sprints help you stay productive. Even when you’re away from the app, widgets and daily notifications help  maintain momentum. Build your library, one writing session at a time.

            Download Shelfify from the App Store today.
            """)
            .font(Font.custom("Bellefair-Regular", size: 18))
            .multilineTextAlignment(.leading)
            HStack {
                Spacer()
                GameButton(text: "Download now", action: {})
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}
