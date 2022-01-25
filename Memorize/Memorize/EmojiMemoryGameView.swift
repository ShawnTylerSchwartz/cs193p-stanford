//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Shawn Schwartz on 1/17/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    // @ObservedObject: when something changes, rebuild the entire body
    @ObservedObject var game: EmojiMemoryGame // might instead call this something like 'game' instead of 'game'
    
    var body: some View {
        AspectVGrid(items: game.model.cards, aspectRatio: 2/3) { card in
            cardView(for: card)
        }
            .foregroundColor(.red)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card)
                .padding(4)
                .onTapGesture {
                    game.choose(card) // here we are expressing user's intent to flip over a card
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.model.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
