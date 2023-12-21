//
//  ViewController.swift
//  Advanced Calculator
//
//  Created by Oladipupo Olasile on 2023-11-24.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var displayLabel: UILabel!
    
    //Computed Properties
   private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Unable to covert to double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        if let calMethod = sender.currentTitle {
            if calMethod == "+/-" {
                displayValue *= -1
            } else if calMethod == "%" {
                displayValue /= 100
            } else if calMethod == "AC" {
                displayLabel.text = String(0)
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }


}

