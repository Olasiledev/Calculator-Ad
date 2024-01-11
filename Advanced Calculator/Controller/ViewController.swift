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
    
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //non-number button logic
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calMethod = sender.currentTitle {
            
            if let result = calculator.calculations(symbol: calMethod) {
                displayValue = result
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //Real number logic
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

