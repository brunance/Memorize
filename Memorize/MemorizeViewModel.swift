//
//  MemorizeViewModel.swift
//  Memorize
//
//  Created by Bruno França do Prado on 29/06/24.
//

import SwiftUI

class MemorizeViewModel: ObservableObject {
    private static let emojis = ["🕷️", "👻", "🎃", "💀", "🕸️", "🍭", "🧙‍♀️", "👹"]

    private static func createMemorygame() -> MemorizeModel<String> {
        return MemorizeModel(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🙈"
            }
        }
    }

    @Published private var model = MemorizeViewModel.createMemorygame()

    var cards: [MemorizeModel<String>.Card] {
        return model.cards
    }

    func shuffle() {
        model.shuffle()
    }

    func choose (_ card: MemorizeModel<String>.Card) {
        model.choose(card)
    }
}
