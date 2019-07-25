//
//  Card.swift
//  Concentration2
//
//  Created by BA on 17/07/19.
//  Copyright © 2019 ethender . All rights reserved.
//

import Foundation

/*
 Diff bw classes and structs
 1. structs no inheritance
 2. structs are value type and classes are reference types
 :In values are copied in structs.
 :But classes are references. if modified everywhere changes
 */
struct Card: Hashable{
    
    
    var hashValue: Int {return identified}
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identified == rhs.identified
    }
    
   
    
    var isFaceUp = false
    var isMatched = false
    private var identified: Int
    
    private static var identifierFactory = 0
    init() {
        self.identified = Card.getUniqueIdentifier()
    }
    
    private static func getUniqueIdentifier()-> Int{
        Card.identifierFactory += 1
        return identifierFactory
    }
}
