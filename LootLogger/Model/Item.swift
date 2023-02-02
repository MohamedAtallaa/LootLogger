//
//  Item.swift
//  LootLogger
//
//  Created by Mohamed Atallah on 31/01/2023.
//

import UIKit

class Item: Equatable {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    
    init(name: String, valueInDollars: Int, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
    }
    
    convenience init(random: Bool) {
        let adjectives = ["Fluffy", "Rusty", "Shiny"]
        let nouns = ["Bear", "Spork", "Mac"]
        
        let randomName = "\(adjectives.randomElement()!) \(nouns.randomElement()!)"
        let randomValue = Int.random(in: 1..<100)
        let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
        
        self.init(name: randomName, valueInDollars: randomValue, serialNumber: randomSerialNumber)
    }
    
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.valueInDollars == rhs.valueInDollars
            && lhs.serialNumber == rhs.serialNumber
            && lhs.dateCreated == rhs.dateCreated
    }
    
    
}
