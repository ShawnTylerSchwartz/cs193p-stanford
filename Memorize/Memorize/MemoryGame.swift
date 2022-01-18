//
//  MemoryGame.swift
//  Memorize
//
//  Created by Shawn Schwartz on 1/17/22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent // better to use a "don't care" type here, instead of a String, for flexibility in the future
    }
}
