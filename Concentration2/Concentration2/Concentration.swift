//
//  Concentration.swift
//  Concentration2
//
//  Created by BA on 17/07/19.
//  Copyright © 2019 ethender . All rights reserved.
//

import Foundation


class Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex:Int?
            for index in cards.indices {
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        //assert(cards.indices.contains(index),"Indices are not matched")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identified == cards[index].identified{
                    cards[matchIndex].isMatched = true
                    cards[matchIndex].isMatched = true
                }else{
                    cards[index].isFaceUp = true
                }
            }else{
                indexOfOneAndOnlyFaceUpCard = index		
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        assert(numberOfPairOfCards > 0,"card are not less than one card")
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            cards += [card, card]
        }
        
    }
}
