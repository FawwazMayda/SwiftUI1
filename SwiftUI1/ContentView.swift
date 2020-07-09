//
//  ContentView.swift
//  SwiftUI1
//
//  Created by Muhammad Fawwaz Mayda on 16/06/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { cardItem in
                CardView(card: cardItem).onTapGesture {
                    self.viewModel.choose(card: cardItem)
                }
            }
            .padding()
            .foregroundColor(Color.orange)
        }
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                Text("\(card.content)")
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }.font(Font.system(size: min(size.width, size.height) * fontScale))
    }
    
    //MARK:- Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3.0
    let fontScale: CGFloat = 0.75
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
