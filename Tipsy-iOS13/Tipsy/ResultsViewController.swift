//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 원성현 on 2022/03/05.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    var finalValue: Float!
    var tipRatio: Float!
    var numOfPeople: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", finalValue)
        let tipPct = Int((tipRatio - 1) * 100)
        let myText:String = "Split between " + String(numOfPeople) + " people, with " + String(tipPct) + " % tip."
        // Do any additional setup after loading the view.
        settingsLabel.text = myText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
