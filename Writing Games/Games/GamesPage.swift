//
//  ThirdPage.swift
//  Get It Write
//
//  Created by Hannah Dadd on 20/10/2025.
//

import SwiftUI
import Combine

struct GamesPage: View {
    @StateObject private var navigationManager = GamesPageNavigationManager()
    @State var path = NavigationPath([GamesPageRoute.vocabGame])
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ScrollView {
                VStack(spacing: 8) {
                    Text("Writing Games")
                    RectangleCTA(title: "Six Word Story", subtitle: "", colour: Color.writingGames, action: {})
                    HStack {
                        SquareCTA(title: "Prompt", colour: Color.writingGames, icon: "pencil.and.scribble", action: {})
                        SquareCTA(title: "Conflict", colour: Color.writingGames, icon: "figure.climbing", action: {})
                    }
                    HStack {
                        SquareCTA(title: "Genre Change", colour: Color.writingGames, icon: "microphone.fill", action: {})
                        SquareCTA(title: "POV Switch", colour: Color.writingGames, icon: "person.3.fill", action: {})
                    }
                    RectangleCTA(title: "Hooky First Sentence", subtitle: "", colour: Color.writingGames, action: {})
                }.padding()
            }
            .navigationDestination(for: GamesPageRoute.self) { route in
                switch route {
                case .vocabGame:
                    VocabGame(action: {
                        navigationManager.reset()
                    })
                case .editingGame:
                    EditingQuestion(back: {
                        navigationManager.reset()
                    })
                }
            }
        }
    }
}

enum GamesPageRoute {
    case vocabGame
    case editingGame
}

final class GamesPageNavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: GamesPageRoute) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path = NavigationPath()
    }
}
