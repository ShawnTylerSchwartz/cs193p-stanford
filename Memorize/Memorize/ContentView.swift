//
//  ContentView.swift
//  Memorize
//
//  Created by Shawn Schwartz on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🐶", "🐱",  "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐷", "🐸", "🐵", "🐔", "🐧", "🐤", "🐣", "🦆", "🦉", "🐴", "🦄", "🦋", "🐠"]
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
