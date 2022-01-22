//
//  ContentView.swift
//  Memorize
//
//  Created by Shawn Schwartz on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    // @ObservedObject: when something changes, rebuild the entire body
    @ObservedObject var viewModel: EmojiMemoryGame // might instead call this something like 'game' instead of 'viewModel'
    
//    var emojis = ["🐶", "🐱",  "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐷", "🐸", "🐵", "🐔", "🐧", "🐤", "🐣", "🦆", "🦉", "🐴", "🦄", "🦋", "🐠"]
//    @State var emojiCount = 20
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
//                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    ForEach(viewModel.model.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                // here we are expressing user's intent to flip over a card
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
//            Spacer()
//            HStack {
//                remove
//                Spacer()
//                add
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
            .padding(.horizontal)
    }
    
//    var remove: some View {
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
//
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct CardView: View {
//    var content: String
//    @State var isFaceUp: Bool = true
    
    let card: MemoryGame<String>.Card // when you build a view, only pass in the minimum that it needs (i.e., here, only the card)
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
//        .onTapGesture {
//            isFaceUp = !isFaceUp
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
