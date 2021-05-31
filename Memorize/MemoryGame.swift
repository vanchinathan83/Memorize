//
//  MemoryGame.swift
//  Memorize
//
//  Created by Vanchinathan Ayipalayam Chandrasekaran on 5/24/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfTheOnlyFaceUpCard: Int? {
        get {cards.indices.filter {cards[$0].isFaceUp}.only}
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    // Mutating signifies that this function updates the model
    mutating func choose(card : Card){
        print("Card that is chosen is \(card)")
        // comma is a sequential AND
        if let chosenIndex = cards.firstIndex(matching: card) , !cards[chosenIndex].isFaceUp , !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            }else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            
        }
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
