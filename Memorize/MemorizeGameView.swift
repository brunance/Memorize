//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Bruno França do Prado on 16/06/24.
//

import SwiftUI

struct MemorizeGameView: View {
    @ObservedObject var viewModel: MemorizeViewModel

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
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
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    var card: MemorizeModel<String>.Card

    init(_ card: MemorizeModel<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12)
            Group {
                cardBase.foregroundStyle(.white)
                cardBase.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            cardBase.opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    MemorizeGameView(viewModel: MemorizeViewModel())
}
