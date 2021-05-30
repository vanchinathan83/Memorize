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
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return 0 // TODO: Need to return something that signifies card cannot be found.
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
