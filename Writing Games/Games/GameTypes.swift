//
//  GamesEnum.swift
//  Writing Games
//
//  Created by Hannah Dadd on 19/01/2026.
//

enum GameTypes {
    
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
    
    func getTitle() -> String {
        switch self {
        case .sixWordStory:
            return "Six Word Story"
        case .conflict:
            return "Resolve Conflict"
        case .genre:
            return "Genre Mashup"
        case .povSwitch:
            return "POV Switch"
        case .prompt:
            return "Prompt"
        case .firstSentence:
            return "Hooky First Sentence"
        case .vocabGame:
            return "Match the Meaning"
        case .buildAWord:
            return "Build a Word"
        case .editingGame:
            return "Cut the Waffle"
        case .addVoice:
            return "Add Voice"
        case .grammar:
            return "Grammar"
        case .passiveToActive:
            return "Passive to Active"
        }
    }
    
    func getIcon() -> String {
        switch self {
        case .sixWordStory:
            return ""
        case .conflict:
            return "figure.climbing"
        case .genre:
            return "microphone.fill"
        case .povSwitch:
            return "person.3.fill"
        case .prompt:
            return "lightbulb.fill"
        case .firstSentence:
            return ""
        case .vocabGame:
            return "text.line.magnify"
        case .buildAWord:
            return "hammer.fill"
        case .editingGame:
            return "pencil.and.scribble"
        case .addVoice:
            return "message.fill"
        case .grammar:
            return "character.cursor.ibeam"
        case .passiveToActive:
            return "figure.run"
        }
    }
}
