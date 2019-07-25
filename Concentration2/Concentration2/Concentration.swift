//
//  Concentration.swift
//  Concentration2
//
//  Created by BA on 17/07/19.
//  Copyright © 2019 ethender . All rights reserved.
//

import Foundation


struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            return cards.indices.filter {cards[$0].isFaceUp }.oneAndOnly
            //return facUpCardIndices.count == 1 ? facUpCardIndices.first : nil
           
        }set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        //assert(cards.indices.contains(index),"Indices are not matched")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index]{
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


extension Collection{
    var oneAndOnly: Element?{
        return count == 1 ? first : nil
    }
}
