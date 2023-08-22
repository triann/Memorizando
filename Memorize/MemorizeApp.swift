//
//  MemorizeApp.swift
//  Memorize
//
//  Created by user239481 on 8/21/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemorizando()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemorizandoGameView(viewModel: game)
        }
    }
}
