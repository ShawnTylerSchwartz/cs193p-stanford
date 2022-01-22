//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Shawn Schwartz on 1/17/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() // classes get a free init() that does nothing; this game is a pointer to EmojiMemoryGame, and classes are mutable so we can change that but do let with game because the pointer itself isn't changing
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
