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
    var rollSound: AVAudioPlayer!
    
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var criticalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        //print to debug screen
        print("we launched the thing...")
    }
   
    func rollDice(){
        //play roll sound
        getSound(fileName: "rolldice")
        
        //get some rando numbers
        let rolledNumber = Int.random(in: 1...20)
        let randCruiser = Int.random(in: 1...2)
    
        //set the name of the image we need based on the rando number
        var imageName = "d\(rolledNumber)"
        
        //change sounds, and message when you hit 1,20 ans sometimes 7
        if(rolledNumber == 1){
            changeStuff(rollNum: rolledNumber, fName: "failwah", text: "BOOO!", show: false)
        }
        else if(rolledNumber == 20){
            changeStuff(rollNum: rolledNumber, fName: "zfanfare", text: "YEAA!", show: false)
        }
        //should run 50% of the time on 7 to show cruiser
        else if(rolledNumber == 7 && randCruiser == 2){
            //should run 50% of the time on 7 to show cruiser- so set unique name
            imageName = "d7cruiser"
            changeStuff(rollNum: rolledNumber, fName: "torpedo", text: "Pew!Pew!", show: false)
        }
        else{
            criticalLabel.isHidden = true
        }
        //set image
        diceImageView.image = UIImage(named: imageName)
    }//end func rolldice
    
    func getSound(fileName: String){
           let path = Bundle.main.path(forResource: fileName, ofType:"mp3")!
           let url = URL(fileURLWithPath: path)
           do {
               rollSound = try AVAudioPlayer(contentsOf: url)
               rollSound?.play()
           } catch {
           }
    }
    
    //trying to condence SET UP
    func changeStuff(rollNum: Int, fName: String, text: String, show: Bool){
        getSound(fileName: fName)
        criticalLabel.text = text
        criticalLabel.isHidden = show
    }
    
    @IBAction func rollDiceFromButton(){
        rollDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
}


