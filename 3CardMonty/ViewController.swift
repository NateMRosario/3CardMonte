//
//  ViewController.swift
//  3CardMonty
//
//  Created by C4Q on 10/16/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var numPlayed = 0
    var cards: [UIButton] = []
    @IBOutlet weak var gameCondition: UILabel!
    @IBOutlet weak var cardOne: UIButton!
    @IBOutlet weak var cardTwo: UIButton!
    @IBOutlet weak var cardThree: UIButton!
    @IBOutlet weak var cardFour: UIButton!
    @IBOutlet weak var cardFive: UIButton!
    @IBOutlet weak var scoreNum: UILabel!
    @IBOutlet weak var played: UILabel!
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var threeCardButton: UIButton!
    @IBOutlet weak var fourCardButton: UIButton!
    @IBOutlet weak var fiveCardButton: UIButton!
    @IBOutlet weak var selectionBackground: UIView!
    
    func notHidden() {
        selectionBackground.isHidden = false
        threeCardButton.isHidden = false
        fourCardButton.isHidden = false
        fiveCardButton.isHidden = false
        cardFour.isHidden = true
        cardFive.isHidden = true
    }
    func hidden() {
        selectionBackground.isHidden = true
        threeCardButton.isHidden = true
        fourCardButton.isHidden = true
        fiveCardButton.isHidden = true
        cardFour.isHidden = true
        cardFive.isHidden = true
    }
    @IBAction func cardSelection(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            hidden()
        case 1:
            hidden()
            cards.append(cardFour)
            cardFour.isHidden = false
        case 2:
            hidden()
            cards.append(cardFour)
            cards.append(cardFive)
            cardFour.isHidden = false
            cardFive.isHidden = false
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        backgroundButton.isUserInteractionEnabled = false
        self.cards = [cardOne, cardTwo, cardThree]
        super.viewDidLoad()
    }
    func randomSelector() -> Int {
        return Int(arc4random_uniform(UInt32(cards.count)))
    }
    @IBAction func reset(_ sender: UIButton) {
        count = 0
        numPlayed = 0
        played.text = numPlayed.description
        scoreNum.text = count.description
    }
    @IBAction func cardButtons(_ sender: UIButton) {
        let random = randomSelector()
        switch sender.tag {
        case 0 where sender.tag == random:
            gameCondition.text = "You Win!"
            count += 1
            sender.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
        case 1 where sender.tag == random:
            gameCondition.text = "You Win!"
            count += 1
            sender.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
        case 2 where sender.tag == random:
            gameCondition.text = "You Win!"
            count += 1
            sender.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
        case 3 where sender.tag == random:
            gameCondition.text = "You Win!"
            count += 1
            sender.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
        case 4 where sender.tag == random:
            gameCondition.text = "You Win!"
            count += 1
            sender.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
        default:
            gameCondition.text = "You Lose!"
            sender.setBackgroundImage(#imageLiteral(resourceName: "loseKing"), for: .normal)
            if random == 0 {
                cardOne.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
            } else if random == 1 {
                cardTwo.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
            } else if random == 2 {
                cardThree.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
            } else if random == 3 {
                cardFour.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
            } else {
                cardFive.setBackgroundImage(#imageLiteral(resourceName: "newKing"), for: .normal)
            }
        }
        numPlayed += 1
        played.text = numPlayed.description
        scoreNum.text = count.description
        
        for card in cards {
            card.isUserInteractionEnabled = false
        }
    }
    @IBAction func newGame(_ sender: UIButton) {
        for card in cards {
            card.isUserInteractionEnabled = true
            card.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal)
            notHidden()
            cards = [cardOne, cardTwo, cardThree]
        }
        gameCondition.text = "Pick a card"
    }
}

