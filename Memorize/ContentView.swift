//
//  ContentView.swift
//  Memorize
//
//  Created by Bruno França do Prado on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🕷️", "👻", "🎃", "💀", "🕸️", "🍭", "🧙‍♀️", "👹"]
    @State var cardCount = 4
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }

    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }

    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }

    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State /* temporário, mudar depois */ var isFaceUp: Bool = true
    let cardBase = RoundedRectangle(cornerRadius: 12)

    var body: some View {
        ZStack {
            Group {
                cardBase.foregroundStyle(.white)
                cardBase.strokeBorder(lineWidth: 10)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            cardBase.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
