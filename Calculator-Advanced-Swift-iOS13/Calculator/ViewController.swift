//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
        
    private var isFinishedTypingNumber: Bool = true
    private var displayedValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("FAT_ERR!")
            }
            return number
        }
        set{
            displayLabel.text = String(displayedValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
       
        
        if let calcOper = sender.currentTitle{
            if calcOper == "+/-"{
                displayedValue *= -1
            }
            else if calcOper == "AC"{
                displayLabel.text = "0"
            }
            else if calcOper == "%"{
                displayedValue *= 0.01
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numVal = sender.currentTitle{
            if isFinishedTypingNumber{
                displayLabel.text = numVal
                isFinishedTypingNumber = false
            } else{
                if numVal == "."{
                    let isInt = floor(displayedValue) == displayedValue
                    if !isInt { return }
                }
                displayLabel.text = displayLabel.text! + numVal
            }
        }
    }
}

