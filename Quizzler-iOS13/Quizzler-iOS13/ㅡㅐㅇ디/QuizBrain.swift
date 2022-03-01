//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by 원성현 on 2022/03/01.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        self.text=q
        self.answer=a
        self.correctAnswer=correctAnswer
    }
}



struct QuizBrain{
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var quizIdx = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[quizIdx].correctAnswer{
            score += 1
            return true
        }else{
            return false
        }
    }
    
    func getQuestionText() -> String{
        return quiz[quizIdx].text
    }
    
    func getFirstAns()->String{
        return quiz[quizIdx].answer[0]
    }
    
    func getSecondAns()->String{
        return quiz[quizIdx].answer[1]
    }
    
    func getThirdAns()->String{
        return quiz[quizIdx].answer[2]
    }
    
    func getProgress() -> Float {
        var progress:Float = Float(quizIdx) / Float(quiz.count)
        if progress == 1 {
            progress=0.0
        }
        return progress
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if quizIdx + 1 < quiz.count{
            quizIdx += 1
        }
        else{
            quizIdx = 0
        }
    }
}
