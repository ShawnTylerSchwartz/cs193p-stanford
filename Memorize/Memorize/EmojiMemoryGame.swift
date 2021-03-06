//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Shawn Schwartz on 1/17/22.
//
// This is the: ViewModel
//

import SwiftUI

// Notes:
//  ViewModel will create it's own model ->
//    the ViewModel itself "is the truth of the app"
//    (i.e., once it's gone, the app/game is over)

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🐶", "🐱",  "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐷", "🐸", "🐵", "🐔", "🐧", "🐤", "🐣", "🦆", "🦉", "🐴", "🦄", "🦋", "🐠"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private(set) var model = createMemoryGame() // private(set) -> other classes and structs can look at the model but they can't change it
    
    // MARK: - Intent(s)
    
    // we are hooking up the UI directly to this intent
    func choose(_ card: Card) {
        model.choose(card)
    }
}
