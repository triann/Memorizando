//
//  ContentView.swift
//  Memorize
//
//  Created by trian on 8/21/23.
//

import SwiftUI

struct EmojiMemorizandoGameView: View {
    @ObservedObject var viewModel: EmojiMemorizando
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Embaralhar") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
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
    }
}

struct EmojiMemorizandoGameView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiMemorizandoGameView(viewModel: EmojiMemorizando())
    }
}
