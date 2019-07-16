//
//  ViewController.swift
//  Concentration2
//
//  Created by ethender  on 06/07/19.
//  Copyright © 2019 ethender . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0{
        didSet{
            flipCountLable.text = "Flips: \(flipCount)"

        }
    }

    var emojiChoices = ["🎃","👺","🧙🏻‍♀️","👻"]
    
    @IBOutlet weak var flipCountLable: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func showCard(_ sender: UIButton) {
        flipCount += 1
        if let carNumber = cardButtons.index(of: sender){
            print("Card Number \(carNumber)")
            flipCard(withEmoji: emojiChoices[carNumber], on: sender)
        }
    
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

