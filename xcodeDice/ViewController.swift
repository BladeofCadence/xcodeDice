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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonPress()
    {
        RollDice()
    }
    
    func RollDice()
    {
        let Dnom = Int.random(in: 1...20)
        let imageName = "d\(Dnom)"
        
        switch Dnom
        {
        case 1:
            Lbel.isHidden = false
            Lbel.text = "You suck"
            break
        case 20:
            Lbel.isHidden = false
            Lbel.text = "You're the cheese"
            break
        default:
            Lbel.isHidden = true
            break
        }
        
        DICe.image = UIImage(named: imageName)
    }
    
}

