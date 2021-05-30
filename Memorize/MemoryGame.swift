//
//  MemoryGame.swift
//  Memorize
//
//  Created by Vanchinathan Ayipalayam Chandrasekaran on 5/24/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    // Mutating signifies that this function updates the model
    mutating func choose(card : Card){
        print("Card that is chosen is \(card)")
        let chosenIndex: Int = cards.firstIndex(matching: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(content:cardContentFactory(pairIndex), id: pairIndex*2))
            cards.append(Card(content:cardContentFactory(pairIndex), id: pairIndex*2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card : Identifiable{
        var isFaceUp: Bool = true
        var isMatched: Bool = true
        var content: CardContent
        var id: Int
    }
}
