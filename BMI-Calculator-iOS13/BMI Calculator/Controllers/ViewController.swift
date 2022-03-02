//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightSliderLabel: UISlider!
    @IBOutlet var weightSliderLabel: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
        //print(sender.value)
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + "kg"
        //print(sender.value)
    }
    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSliderLabel.value
        let weight = weightSliderLabel.value
        let bmi = weight / (height*height)
        
    }
    
}

