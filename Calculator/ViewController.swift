//
//  ViewController.swift
//  Calculator
//
//  Created by DAN LIU on 4/15/16.
//  Copyright © 2016 DAN LIU. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    
    
    var sound = NSURL(fileURLWithPath:
        NSBundle.mainBundle().pathForResource("button", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()


    @IBOutlet var btnResult: UITextField!
    
    var result = Float()
    var currentNumber = Float()
    
    var currentOp = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: sound,
                fileTypeHint: AVFileTypeMPEGLayer3)
        } catch let error as NSError {
            print("AV Sound Error: \(error.localizedDescription)")
        }
        
        
        
        currentOp = "="
        btnResult.text = ("\(result)")
        
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnNumberInput(sender: UIButton) {
        
        currentNumber = currentNumber * 10 + Float(Int(sender.titleLabel!.text!)!)
        btnResult.text = ("\(currentNumber)")
        
        audioPlayer.play()
    }

    @IBAction func btnOperation(sender: UIButton) {
        switch currentOp{
            case "=":
            result = currentNumber
            case "+":
            result = result + currentNumber
            case "-":
            result = result - currentNumber
            case "*":
            result = result * currentNumber
            case "/":
            result = result / currentNumber
            
        default:
            print("error")
            
        }
        
        currentNumber = 0
        btnResult.text = ("\(result)")
        if (sender.titleLabel!.text == "="){
            result = 0
        }
        currentOp = sender.titleLabel!.text! as String!
        
        audioPlayer.play()
    
    }
    
    @IBAction func btnClear(sender: UIButton) {
        result = 0
        currentNumber = 0
        currentOp = "="
        btnResult.text = ("\(result)")
        
        audioPlayer.play()
    
    }
    
    
    
}


