//
//  ViewController.swift
//  D20SWIFT
//
//  Created by Paula Berggren on 1/21/20.
//  Copyright © 2020 Paula Berggren. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var diceImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func rollDice(){
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
    }

    @IBAction func rollDiceFromButton(){
        rollDice()
    }
}

