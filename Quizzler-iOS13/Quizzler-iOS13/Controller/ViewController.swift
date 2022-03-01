//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let result: Bool = quizBrain.checkAnswer(userAnswer)
        
        if result {
            sender.backgroundColor = UIColor.green
            quizBrain.nextQuestion()
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    

    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        firstButton.backgroundColor = UIColor.clear
        firstButton.setTitle(quizBrain.getFirstAns(),for: .normal)
        secondButton.backgroundColor = UIColor.clear
        secondButton.setTitle(quizBrain.getSecondAns(), for: .normal)
        thirdButton.backgroundColor = UIColor.clear
        thirdButton.setTitle(quizBrain.getThirdAns(), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : " + String(quizBrain.getScore())
        
    }
    
}

