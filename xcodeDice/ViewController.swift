//
//  ViewController.swift
//  xcodeDice
//
//  Created by Kelli Norris on 11/18/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var DICe: UIImageView!
    @IBOutlet var Lbel: UILabel!
    var audioPlayer: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonPress()
    {
        RollDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        if (motion == .motionShake)
        {
            RollDice();
        }
    }
    
    func RollDice()
    {
        
        var url: URL
        let pathToSound = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!
        let failpath = Bundle.main.path(forResource: "failwah", ofType: "mp3")!
        let winpath = Bundle.main.path(forResource: "zfanfare", ofType: "mp3")!
        
        let Dnom = Int.random(in: 1...20)
        let imageName = "d\(Dnom)"
        
        switch Dnom
        {
        case 1:
            Lbel.isHidden = false
            Lbel.text = "You suck"
            url = URL(fileURLWithPath: failpath)
            break
        case 20:
            Lbel.isHidden = false
            Lbel.text = "You're the cheese"
            url = URL(fileURLWithPath: winpath)
            break
        default:
            Lbel.isHidden = true
            url = URL(fileURLWithPath: pathToSound)
            break
        }
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch
        {
            print("error babe")
        }
        
        DICe.image = UIImage(named: imageName)
    }
    
}

