//
//  ViewController.swift
//  Concentration2
//
//  Created by ethender  on 06/07/19.
//  Copyright © 2019 ethender . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   private lazy var game = Concentration(numberOfPairOfCards: numberOfPairsOfCards)
    
     var numberOfPairsOfCards: Int {
        return (cardButtons.count/2)
    }
    
    private(set) var flipCount = 0{
        didSet{
            flipCountLable.text = "Flips: \(flipCount)"

        }
    }

    private var emojiChoices = ["🎃","👺","🧙🏻‍♀️","👻"]
    private var emoji = [Int:String]()
    @IBOutlet private weak var flipCountLable: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    
    @IBAction private func showCard(_ sender: UIButton) {
        flipCount += 1
        if let carNumber = cardButtons.index(of: sender){
            game.chooseCard(at: carNumber)
            updateViewFromModel()
        }
    
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
   private  func emoji(for card:Card)->String{
        if emoji[card.identified] == nil, emojiChoices.count > 0{
            emoji[card.identified] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card.identified] ?? "?"
    }
    
}

extension Int{
    var arc4random: Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
            
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
            
        }else{
            return 0
        }
        
    }
}
