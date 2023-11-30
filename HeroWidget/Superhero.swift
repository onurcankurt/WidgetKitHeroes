//
//  Superhero.swift
//  HeroWidget
//
//  Created by onur on 30.11.2023.
//

import Foundation

struct Superhero : Identifiable, Codable {
    
    let image : String
    let name : String
    let realName : String
    
    var id : String {image}
    
}


let batman = Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne")
let wolverine = Superhero(image: "wolverine", name: "Wolverine", realName: "Logan")
let hulk = Superhero(image: "hulk", name: "Hulk", realName: "Bruce Banner")
let spiderman = Superhero(image: "spiderman", name: "Spider Man", realName: "Peter Parker")
let deadpool = Superhero(image: "deadpool", name: "Deadpool", realName: "Wade Wilson")
