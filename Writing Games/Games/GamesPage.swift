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
    @State var path = NavigationPath([GameTypes.vocabGame])
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ScrollView {
                VStack(spacing: 34) {
                    HeadlineAndSubtitle(title: "Writing Games", subtitle: "Games to keep you on top writing form.")
                    HighScorePromo()
                    VStack(spacing: 8) {
                        SubTitle(title: "Writing Games")
                        RectangleCTA(title: GameTypes.sixWordStory.getTitle(), colour: Color.writingGames, action: {
                            navigationManager.navigate(to: .sixWordStory)
                        })
                        HStack {
                            SquareCTA(gameType: GameTypes.prompt, colour: Color.writingGames,  action: {
                                navigationManager.navigate(to: .prompt)
                            })
                            SquareCTA(gameType: GameTypes.conflict, colour: Color.writingGames, action: {
                                navigationManager.navigate(to: .conflict)
                            })
                        }
                        HStack {
                            SquareCTA(gameType: GameTypes.genre, colour: Color.writingGames, action: {
                                navigationManager.navigate(to: .genre)
                            })
                            SquareCTA(gameType: GameTypes.povSwitch, colour: Color.writingGames, action: {
                                navigationManager.navigate(to: .povSwitch)
                            })
                        }
                        RectangleCTA(title: GameTypes.firstSentence.getTitle(), colour: Color.writingGames, action: {
                            navigationManager.navigate(to: .firstSentence)
                        })
                    }
                    VStack(spacing: 8) {
                        SubTitle(title: "Vocab Games")
                        HStack {
                            SquareCTA(gameType: GameTypes.vocabGame, colour: Color.timedGames, action: {
                                navigationManager.navigate(to: .vocabGame)
                            })
                            SquareCTA(gameType: GameTypes.buildAWord, colour: Color.timedGames, action: {
                                navigationManager.navigate(to: .buildAWord)
                            })
                        }
                    }
                    VStack(spacing: 8) {
                        SubTitle(title: "Editing Games")
                        HStack {
                            SquareCTA(gameType: GameTypes.addVoice, colour: Color.editingGames, action: {
                                navigationManager.navigate(to: .addVoice)
                            })
                            SquareCTA(gameType: GameTypes.grammar, colour: Color.editingGames, action: {
                                navigationManager.navigate(to: .grammar)
                            })
                        }
                        HStack {
                            SquareCTA(gameType: GameTypes.passiveToActive, colour: Color.editingGames, action: {
                                navigationManager.navigate(to: .passiveToActive)
                            })
                            SquareCTA(gameType: GameTypes.editingGame, colour: Color.editingGames, action: {
                                navigationManager.navigate(to: .editingGame)
                            })
                        }
                    }
                    GetItWriteCTA()
                }
                .padding()
            }
            .navigationDestination(for: GameTypes.self) { route in
                switch route {
                case .vocabGame:
                    VocabGame()
                case .editingGame:
                    CutTheWaffle(back: {
                        navigationManager.reset()
                    })
                case .sixWordStory:
                    SixWordStory()
                case .conflict:
                    ConflictGame()
                case .genre:
                    GenreGame()
                case .povSwitch:
                    POVGame()
                case .prompt:
                    WritingPrompt()
                case .firstSentence:
                    HookyFirstSentenceGame()
                case .buildAWord:
                    SplitWordGame()
                case .addVoice:
                    AddVoiceGame()
                case .grammar:
                    GrammarGame()
                case .passiveToActive:
                    PassiveToActiveGame()
                }
            }
        }
    }
}

final class GamesPageNavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: GameTypes) {
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
