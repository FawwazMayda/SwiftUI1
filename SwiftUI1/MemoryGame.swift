//
//  MemoryGame.swift
//  SwiftUI1
//
//  Created by Muhammad Fawwaz Mayda on 17/06/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("chosen card: \(card)")
        let cardIndex = self.index(of: card)
        //self.cards[cardIndex].isFaceUp.toggle()
        self.cards[cardIndex].isFaceUp = !self.cards[cardIndex].isFaceUp
        //print("new card: \(self.cards[cardIndex])")
    }
    
    func index(of card: Card)-> Int {
        for i in 0..<self.cards.count {
            if self.cards[i].id == card.id {
                return i
            }
        }
        return 0
    }
    
    init(numberPairsOfCard: Int, cardContentFactory: (Int)->CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberPairsOfCard {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2 + 1, content: content))
        }
    }
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatching: Bool = false
        var content: CardContent
    }
}
