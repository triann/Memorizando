//
//  ContentView.swift
//  Memorize
//
//  Created by user239481 on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(Virada: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.green)
        .padding()
    }
}

struct CardView: View {
    var Virada: Bool = false
    var body: some View {
        ZStack(content: {
            if Virada {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👀").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}
