//
//  HeroView.swift
//  HeroWidget
//
//  Created by onur on 1.12.2023.
//

import SwiftUI

struct HeroView: View {
    
    let hero : Superhero
    
    var body: some View {
        HStack{
            
            CircularImageView(image: Image(hero.image))
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            Spacer()
            VStack{
                Text(hero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Text(hero.realName).fontWeight(.bold)
            }.padding()
            Spacer()
            
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
        
    }
}

#Preview {
    HeroView(hero: spiderman)
}
