//
//  ContentView.swift
//  Memorize
//
//  Created by trian on 8/21/23.
//

import SwiftUI

struct EmojiMemorizandoGameView: View {
    var viewModel: EmojiMemorizando
    
    let emojis = ["👀","🫀","🦷","🧠","🫁","👅","👣","🖐️"]
        
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.black)
    }
    
    
}

struct CardView: View {
    let content: String
    @State var Virada = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(Font.largeTitle)
            }
            .opacity(Virada ? 1 : 0)
            base.fill().opacity(Virada ? 0 : 1)
            
        }
        .onTapGesture  {
            Virada.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
