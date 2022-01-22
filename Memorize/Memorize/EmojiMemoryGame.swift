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

class EmojiMemoryGame {
    static let emojis = ["🐶", "🐱",  "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐷", "🐸", "🐵", "🐔", "🐧", "🐤", "🐣", "🦆", "🦉", "🐴", "🦄", "🦋", "🐠"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private(set) var model: MemoryGame<String> = createMemoryGame() // private(set) -> other classes and structs can look at the model but they can't change it
 
    // could use this as a "read-only" method for a private model var (instead of private(set)):
    // var cards: Array<MemoryGame<String>.Card> {
    //    return model.cards
    // }
}
