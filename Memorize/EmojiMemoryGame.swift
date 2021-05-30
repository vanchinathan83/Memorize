//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Vanchinathan Ayipalayam Chandrasekaran on 5/24/21.
//

import Foundation

class EmojiMemoryGame : ObservableObject {
    // @Published helps us to avoid ObservableObjectPublisher.send() in every Intent
    // method that modifies the model.
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🕷","👻","🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: 3) {pairIndex in
            return emojis[pairIndex]
            
        }
    }
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
     
}
