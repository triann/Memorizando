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
            CardView(Virada: false)
            CardView()
            CardView(Virada: true)
            CardView(Virada: true)
        }
        .foregroundColor(.green)
        .padding()
    }
}

struct CardView: View {
    @State var Virada = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if Virada {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👀").font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture  {
            Virada.toggle()
        }
    }
}
