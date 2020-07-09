//
//  EmojiMemoryGame.swift
//  SwiftUI1
//
//  Created by Muhammad Fawwaz Mayda on 17/06/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🍙","🎛","✂️"]
        return MemoryGame<String>(numberPairsOfCard: emojis.count) {pairIndex in
            return emojis[pairIndex]
        }
        
    }
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    func choose(card: MemoryGame<String>.Card ) {
        objectWillChange.send()
        model.choose(card: card)
    }
}



struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
