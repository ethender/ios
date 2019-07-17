//
//  Concentration.swift
//  Concentration2
//
//  Created by BA on 17/07/19.
//  Copyright © 2019 ethender . All rights reserved.
//

import Foundation


class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identified == cards[index].identified{
                    cards[matchIndex].isMatched = true
                    cards[matchIndex].isMatched = true
                }else{
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = nil
                }
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            cards += [card, card]
        }
        
    }
}
