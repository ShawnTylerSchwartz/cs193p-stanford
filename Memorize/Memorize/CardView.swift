//
//  CardView.swift
//  Memorize
//
//  Created by Shawn Schwartz on 1/23/22.
//

import SwiftUI

struct CardView: View {
    let card: EmojiMemoryGame.Card // when you build a view, only pass in the minimum that it needs (i.e., here, only the card)
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}
