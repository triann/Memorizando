//
//  EmojiMemorizando.swift
//  Memorizar
//
//  Created by user239481 on 8/22/23.
//

import SwiftUI

class EmojiMemorizando: ObservableObject {
    private static let emojis =
        ["👀","🫀","🦷","🧠","🫁","👅","👣","🖐️"]
       
    private static func createMemorizandoGame () -> MemorizandoGame<String> {
        MemorizandoGame(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "❌"
            }
        }
    }
        
    @Published private var model = createMemorizandoGame()
    
    var cards: Array<MemorizandoGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemorizandoGame<String>.Card) {
        model.choose(card)
    }
}
