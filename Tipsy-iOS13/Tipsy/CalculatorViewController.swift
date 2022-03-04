//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var finalValue: Float!
    var tipRatio: Float!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let selection: String = sender.currentTitle ?? "nil"
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        if selection == "0%"{
            zeroPctButton.isSelected = true
        }
        else if selection == "10%"{
            tenPctButton.isSelected = true
        }
        else if selection == "20%"{
            twentyPctButton.isSelected = true
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        sender.isSelected = true
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var totalBill:Float = Float(billTextField.text ?? "0.0") ?? 0.0
        var tipPct:Float = 1.0
        if tenPctButton.isSelected{
            tipPct = 1.1
        }
        else if zeroPctButton.isSelected{
            tipPct = 1.0
        }
        else if twentyPctButton.isSelected{
            tipPct = 1.2
        }
       
        totalBill *= tipPct
        
        let finVal = totalBill / Float(splitNumberLabel.text!)!
        tipRatio = tipPct
        finalValue = finVal
    
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalValue = finalValue
            destinationVC.numOfPeople = Int(splitNumberLabel.text ?? "2.0")
            destinationVC.tipRatio = tipRatio
        }
    }
    
}

