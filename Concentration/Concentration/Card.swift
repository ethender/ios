//
//  Card.swift
//  Concentration
//
//  Created by ethender  on 29/04/18.
//  Copyright © 2018 ethender . All rights reserved.
//

import Foundation


struct Card {
    
    
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    static var  identifierFactory = 0
    static func getuniqueIdentifier() -> Int{
       identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getuniqueIdentifier()
    }
    
}
