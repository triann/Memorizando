//
//  MemorizandoGame.swift
//  Memorizar
//
//  Created by trian on 8/22/23.
//

import Foundation

struct MemorizandoGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent ) {
        cards = []
        // adicionar  numberOfPairsOfCards x 2 cards
        for pairIndex in 00..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
                                    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        var Virada = true
        var isMatched = false
        let content: CardContent
    }
}
