//
//  ContentView.swift
//  HeroWidget
//
//  Created by onur on 30.11.2023.
//

import SwiftUI

let superHeroArray = [spiderman, hulk, deadpool, batman, wolverine]

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(superHeroArray){hero in
                HeroView(hero: hero)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
