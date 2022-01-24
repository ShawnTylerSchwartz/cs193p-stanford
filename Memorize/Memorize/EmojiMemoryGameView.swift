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
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.model.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                // here we are expressing user's intent to flip over a card
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
