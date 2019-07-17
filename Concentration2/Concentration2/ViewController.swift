//
//  ViewController.swift
//  Concentration2
//
//  Created by ethender  on 06/07/19.
//  Copyright © 2019 ethender . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   lazy var game = Concentration(numberOfPairOfCards: cardButtons.count)
    
    var flipCount = 0{
        didSet{
            flipCountLable.text = "Flips: \(flipCount)"

        }
    }

    var emojiChoices = ["🎃","👺","🧙🏻‍♀️","👻"]
    var emoji = [Int:String]()
    @IBOutlet weak var flipCountLable: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func showCard(_ sender: UIButton) {
        flipCount += 1
        if let carNumber = cardButtons.index(of: sender){
            game.chooseCard(at: carNumber)
            updateViewFromModel()
        }
    
    }
    
    func updateViewFromModel(){
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
    
    func emoji(for card:Card)->String{
        if emoji[card.identified] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identified] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identified] ?? "?"
    }
    
}

