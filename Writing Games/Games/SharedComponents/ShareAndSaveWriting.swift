//
//  ShareAndSaveWriting.swift
//  Writing Games
//
//  Created by Hannah Dadd on 22/01/2026.
//

import SwiftUI

struct ShareAndSaveWriting: View {
    @State var savedButtonTapped = false
    
    let saveText: String
    let shareText: String
    let appStorageKey: String
    
    var body: some View {
        HStack {
            GameButton(text: savedButtonTapped ? "Saved" : "Save", action: {
                if !savedButtonTapped {
                    var saves = UserDefaults.standard.array(forKey: appStorageKey) as? [String] ?? []
                    saves.append(saveText)
                    UserDefaults.standard.set(saves, forKey: appStorageKey)
                    savedButtonTapped = true
                }
            })
            GameButton(text: "Share", action: {
                let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
            })
        }
    }
}
