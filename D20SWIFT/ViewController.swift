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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   }
    func rollDice(){
        //play roll sound
        let path = Bundle.main.path(forResource: "rolldice", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            rollSound = try AVAudioPlayer(contentsOf: url)
            rollSound?.play()
        } catch {
        }
        
        let rolledNumber = Int.random(in: 1...20)
        
        var imageName = "d\(rolledNumber)"
        
        if(rolledNumber == 7){
            let rolledNumber2 = Int.random(in: 1...2)
            if(rolledNumber2 == 2){
                imageName = "d7cruiser"
                let path = Bundle.main.path(forResource: "torpedo", ofType:"mp3")!
                let url = URL(fileURLWithPath: path)
                do {
                    rollSound = try AVAudioPlayer(contentsOf: url)
                    rollSound?.play()
                } catch {
                }
            }
        }
    
        diceImageView.image = UIImage(named: imageName)
        
        if(rolledNumber == 1){
            let path = Bundle.main.path(forResource: "failwah", ofType:"mp3")!
            let url = URL(fileURLWithPath: path)
            do {
                rollSound = try AVAudioPlayer(contentsOf: url)
                rollSound?.play()
            } catch {
            }
        }
        if(rolledNumber == 20){
            //play roll sound
            let path = Bundle.main.path(forResource: "zfanfare", ofType:"mp3")!
            let url = URL(fileURLWithPath: path)
            do {
                rollSound = try AVAudioPlayer(contentsOf: url)
                rollSound?.play()
            } catch {
            }
        }
    }

    @IBAction func rollDiceFromButton(){
        rollDice()
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
}

