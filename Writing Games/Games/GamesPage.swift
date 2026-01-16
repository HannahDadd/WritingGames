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
                    PromptsCTA()
                    VocabCTA(action: {
                        navigationManager.navigate(to: .vocabGame)
                    })
                    EditingGameCTA(action: {
                        navigationManager.navigate(to: .editingGame)
                    })
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
