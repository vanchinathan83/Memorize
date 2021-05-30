//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vanchinathan Ayipalayam Chandrasekaran on 5/18/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel:game)
        }
    }
}
