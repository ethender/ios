//
//  ViewController.swift
//  Concentration
//
//  Created by ethender  on 10/04/18.
//  Copyright © 2018 ethender . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
   
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func newGame(_ sender: UIButton) {
        
        game.newGame(numbeOfPairsOfCards: (cardButtons.count+1)/2)
        flipCount = 0
        for buttIndex in cardButtons.indices{
            let button = cardButtons[buttIndex]
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        
        
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
      
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            updateFlipCount()
        }else{
            print("No Button Selected")
        }
        
    }
  
    func updateViewFromModel(){
        for index in cardButtons.indices{
         let button = cardButtons[index]
         let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    
    func updateFlipCount(){
        var temp = 0
        for buttIndex in cardButtons.indices{
            let button = cardButtons[buttIndex]
            if let color = button.backgroundColor , color == #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1){
                temp += 1
            }
        }
        if temp >= 2 {
            flipCount += 1
        }
    }
    
    var emojiChoices = ["🎃","👻","😈","☠️","👽","🍭","🍬","🍎"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
       /* if  emoji[card.identifier] != nil{
            return emoji[card.identifier]!
        }else{
            return "?"
        }*/
        //it will run first if then second if
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
            
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle  == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else  {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }


}

