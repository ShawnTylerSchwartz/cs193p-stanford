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
    static let emojis = ["🐶", "🐱",  "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐷", "🐸", "🐵", "🐔", "🐧", "🐤", "🐣", "🦆", "🦉", "🐴", "🦄", "🦋", "🐠"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
//    var objectWillChange: ObservableObjectPublisher // we don't need to actually put this (we get this for free)
    
    @Published private(set) var model: MemoryGame<String> = createMemoryGame() // private(set) -> other classes and structs can look at the model but they can't change it
 
    // could use this as a "read-only" method for a private model var (instead of private(set)):
    // var cards: Array<MemoryGame<String>.Card> {
    //    return model.cards
    // }
    
    // MARK: - Intent(s)
    
    // we are hooking up the UI directly to this intent
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send() // this says send to the world that this object will change (batched up to one redraw on change); but we don't even need this because of @Published
        model.choose(card)
    }
}
