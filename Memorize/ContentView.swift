//
//  ContentView.swift
//  Memorize
//
//  Created by user239481 on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👀","🫀","🦷","🧠","🧠"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.green)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var Virada = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if Virada {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture  {
            Virada.toggle()
        }
    }
}
