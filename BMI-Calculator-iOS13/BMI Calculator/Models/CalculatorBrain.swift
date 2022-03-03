//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 원성현 on 2022/03/03.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit


struct BMI {
    let value: Float
    let advice: String
    let color: UIColor
}

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float,weight: Float){
        let bmiValue = weight / (height*height)
    
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pie", color: UIColor.green)
        }
        else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle!", color: UIColor.yellow)
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Eat less pie", color: UIColor.red)
        }
    }
    
    func getBMIValue() -> String{
        
        let bmiSingleDec = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiSingleDec
      
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "None"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.clear
    }
    

}
