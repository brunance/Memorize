//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Bruno França do Prado on 29/06/24.
//

import Foundation

struct MemorizeModel<CardContent> {
    var cards: [Card]

    func chooseCard(card: Card) {

    }

    struct Card {
        var isfaceUp: Bool
        var isMatched: Bool
        var content: CardContent

    }
}
