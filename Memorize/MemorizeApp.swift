//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Bruno França do Prado on 16/06/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = MemorizeViewModel()

    var body: some Scene {
        WindowGroup {
            MemorizeGameView(viewModel: game)
        }
    }
}
