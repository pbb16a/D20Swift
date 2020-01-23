//
//  ViewController.swift
//  D20SWIFT
//
//  Created by Paula Berggren on 1/21/20.
//  Copyright © 2020 Paula Berggren. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    var rollSound: AVAudioPlayer?
    
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var criticalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        //print to debug screen
        print("we launched the thing...")
    }
    func getSound(fileName: String){
        let path = Bundle.main.path(forResource: fileName, ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            rollSound = try AVAudioPlayer(contentsOf: url)
            rollSound?.play()
        } catch {
        }
    }
    func rollDice(){
        //play roll sound
        getSound(fileName: "rolldice")
        
        let rolledNumber = Int.random(in: 1...20)
        
        var imageName = "d\(rolledNumber)"
        
        if(rolledNumber == 7){
            let rolledNumber2 = Int.random(in: 1...2)
            if(rolledNumber2 == 2){
                imageName = "d7cruiser"
                getSound(fileName: "torpedo")
                criticalLabel.text = "Pew! Pew!"
                criticalLabel.isHidden = false
            }
        }
        else if(rolledNumber == 1){
            getSound(fileName: "failwah")
            criticalLabel.text = "BOOOO!"
            criticalLabel.isHidden = false
        }
        else if(rolledNumber == 20){
            getSound(fileName: "zfanfare")
            criticalLabel.text = "YEAAAAAA!"
            criticalLabel.isHidden = false
        }
        else{
            criticalLabel.isHidden = true
        }
        
        diceImageView.image = UIImage(named: imageName)
    //end func rolldice
    }
    //trying to condence SET UP
//    func changeStuff(rolledNum: Int, fileName: String, text: String, show: Bool){
//        getSound(fileName: T##String)
//        criticalLabel.text = text
//        criticalLabel.isHidden = show
//    }
    
    @IBAction func rollDiceFromButton(){
        rollDice()
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
}


