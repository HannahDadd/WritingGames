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
                VStack(spacing: 34) {
                    HeadlineAndSubtitle(title: "Writing Games", subtitle: "Games to keep you on top writing form.")
                    VStack(spacing: 8) {
                        SubTitle(title: "Writing Games")
                        RectangleCTA(title: "Six Word Story", colour: Color.writingGames, action: {
                            navigationManager.navigate(to: .sixWordStory)
                        })
                        HStack {
                            SquareCTA(title: "Prompt", colour: Color.writingGames, icon: "lightbulb.fill", action: {
                                navigationManager.navigate(to: .prompt)
                            })
                            SquareCTA(title: "Conflict", colour: Color.writingGames, icon: "figure.climbing", action: {
                                navigationManager.navigate(to: .conflict)
                            })
                        }
                        HStack {
                            SquareCTA(title: "Genre Change", colour: Color.writingGames, icon: "microphone.fill", action: {
                                navigationManager.navigate(to: .genre)
                            })
                            SquareCTA(title: "POV Switch", colour: Color.writingGames, icon: "person.3.fill", action: {
                                navigationManager.navigate(to: .povSwitch)
                            })
                        }
                        RectangleCTA(title: "Hooky First Sentence", colour: Color.writingGames, action: {
                            navigationManager.navigate(to: .firstSentence)
                        })
                    }
                    VStack(spacing: 8) {
                        SubTitle(title: "Vocab Games")
                        HStack {
                            SquareCTA(title: "Match the Meaning", colour: Color.timedGames, icon: "text.line.magnify", action: {
                                navigationManager.navigate(to: .vocabGame)
                            })
                            SquareCTA(title: "Build a Word", colour: Color.timedGames, icon: "hammer.fill", action: {
                                navigationManager.navigate(to: .buildAWord)
                            })
                        }
                    }
                    VStack(spacing: 8) {
                        SubTitle(title: "Editing Games")
                        HStack {
                            SquareCTA(title: "Add Voice", colour: Color.editingGames, icon: "message.fill", action: {
                                navigationManager.navigate(to: .addVoice)
                            })
                            SquareCTA(title: "Grammar", colour: Color.editingGames, icon: "pencil.and.scribble", action: {
                                navigationManager.navigate(to: .grammar)
                            })
                        }
                        HStack {
                            SquareCTA(title: "Passive to Active", colour: Color.editingGames, icon: "figure.run", action: {
                                navigationManager.navigate(to: .passiveToActive)
                            })
                            SquareCTA(title: "Cut the Waffle", colour: Color.editingGames, icon: "character.cursor.ibeam", action: {
                                navigationManager.navigate(to: .editingGame)
                            })
                        }
                    }
                }
                .padding()
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
                case .sixWordStory:
                    SixWordStory()
                case .conflict:
                    ConflictGame()
                case .genre:
                    GenreGame()
                case .povSwitch:
                    POVGame()
                case .prompt:
                    ExpandedPrompt()
                case .firstSentence:
                    HookyFirstSentenceGame()
                case .buildAWord:
                    SplitWordGame(action: {})
                case .addVoice:
                    AddVoiceGame(back: {})
                case .grammar:
                    GrammarGame(back: {})
                case .passiveToActive:
                    PassiveToActiveGame(back: {})
                }
            }
        }
    }
}

enum GamesPageRoute {
    
    case sixWordStory
    case conflict
    case genre
    case povSwitch
    case prompt
    case firstSentence
    
    case vocabGame
    case buildAWord
    
    case editingGame
    case addVoice
    case grammar
    case passiveToActive
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
