//
//  ContentView.swift
//  HeroWidget
//
//  Created by onur on 30.11.2023.
//

import SwiftUI

let superHeroArray = [spiderman, hulk, deadpool, batman, wolverine]

struct ContentView: View {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.onurcankurt.HeroWidget"))
    var heroData : Data = Data()
    
    var body: some View {
        VStack {
            ForEach(superHeroArray){hero in
                HeroView(hero: hero)
                    .onTapGesture {
                        saveToDefaults(hero: hero)
                }
            }
        }
        .padding()
    }
    
    func saveToDefaults(hero: Superhero) {
        //print(hero.name)
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData
            print(hero.name)
        }  
    }
}

#Preview {
    ContentView()
}
