//
//  MemoryGame.swift
//  Memorize
//
//  Created by Shawn Schwartz on 1/17/22.
//
// This is the: Memory Game Model
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) { // mutating will allow this to change *because self is immutable*
        let chosenIndex = index(of: card)
//        var chosenCard = cards[chosenIndex] // this is a copy of cards, so we need to change cards directly
//        chosenCard.isFaceUp.toggle()
        cards[chosenIndex].isFaceUp.toggle()
//        print("chosenCard = \(chosenCard)")
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int { // (of) is the external name, (card) is internal name
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x 2 to cards array (to get the pairs)
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent // better to use a "don't care" type here, instead of a String, for flexibility in the future
        var id: Int // for behaving like an Identifiable (a don't care, but needs to be hashable and equatable); Int is hashable
    }
}
