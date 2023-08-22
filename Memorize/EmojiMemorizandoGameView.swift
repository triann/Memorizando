//
//  ContentView.swift
//  Memorizando
//
//  Created by trian on 8/21/23.
//

import SwiftUI

struct EmojiMemorizandoGameView: View {
    @ObservedObject var viewModel: EmojiMemorizando
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
                cards
                    .animation(.default, value: viewModel.cards)
            Button("Embaralhar") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
                CardView(card)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
        }
        .foregroundColor(Color.black)
    }
}

struct CardView: View {
    let card: MemorizandoGame<String>.Card
    
    init (_ card: MemorizandoGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.Virada ? 1 : 0)
            base.fill()
                .opacity(card.Virada ? 0 : 1)
        }
        .opacity(card.Virada || !card.isMatched ? 1 : 0)
    }
}

struct EmojiMemorizandoGameView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiMemorizandoGameView(viewModel: EmojiMemorizando())
    }
}
