//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Vanchinathan Ayipalayam Chandrasekaran on 5/18/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            Grid(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }.padding(5)
            }
        }.padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).size(width: 10, height: 20).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
            }
        }.font(Font.system(size: fontSize(size: size)))
    }
    // MARK: Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3.0
    func fontSize(size: CGSize) -> CGFloat {
        (min(size.width, size.height) * 0.75)
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
