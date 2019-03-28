//
//  ViewController.swift
//  FBLA
//
//  Created by Delaney Barrow on 3/25/19.
//  Copyright © 2019 Delaney Barrow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlets for the questions and answers on the quiz
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    //IBActions to change question and add points if needed when an answer is chosen
    @IBAction func handleSubmitAnswer0(_ sender: Any) {
        checkAnswer(choiceNo: 0)
    }
    @IBAction func handleSubmitAnswer1(_ sender: Any) {
        checkAnswer(choiceNo: 1)
    }
    @IBAction func handleSubmitAnswer2(_ sender: Any) {
        checkAnswer(choiceNo: 2)
    }
    @IBAction func handleSubmitAnswer3(_ sender: Any) {
        checkAnswer(choiceNo: 3)
    }
    
    //IBOutlet to keep question progress updated
    @IBOutlet weak var progressLabel: UILabel!
    
    //sets questions and updates progressLabel
    func setQuestion() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "Question \(currentQuestionPosition + 1) of \(questions.count)"
    }
    
    //loads in the questions
    func loadNextQuestion() {
        if ((currentQuestionPosition + 1) == questions.count) {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        } else {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }
    }
    
    //checks to see if answer picked is rights, adds one to score if it is
    func checkAnswer(choiceNo: Int) {
        if (choiceNo == currentQuestion!.correctAnswer) {
            noCorrect += 1
            loadNextQuestion()
        } else {
            loadNextQuestion()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            let vc = segue.destination as! ResultsViewController
            vc.noCorrect = noCorrect
            vc.total = questions.count
        }
    }
    
    //creates a struct for the questions to be changed
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    //subset of the struct, stores the different questions and answers, as well as the correct answers for the array
    var questions: [Question] = [
        Question(
            question: "When was FBLA founded?",
            answers: ["1937", "1940", "1941", "1943"],
            correctAnswer: 1),
        Question(
            question: "Where is the FBLA HQ located?",
            answers: ["Virginia", "New York", "Maryland", "Texas"],
            correctAnswer: 0),
        Question(
            question: "How many divisions of FBLA are there?",
            answers: ["2", "3", "4", "5"],
            correctAnswer: 2),
        Question(
            question: "Where is the NLC this year?",
            answers: ["San Antonio", "Baltimore", "Delaware", "San Francisco"],
            correctAnswer: 0),
        Question(
            question: "Who founded FBLA?",
            answers: ["Edward D. Miller", "James A. Lock", "Harry P. Rodger", "Hamden L. Forkner"],
            correctAnswer: 3),
        Question(
            question: "Where was the first state chapter?",
            answers: ["Oklahoma", "Indiana", "Iowa", "Ohio"],
            correctAnswer: 2),
        Question(
            question: "Which is not an FBLA-PBL region?",
            answers: ["Eastern", "North Central", "Mountain Plains", "Southwestern"],
            correctAnswer: 3),
        Question(
            question: "Who is the current president and CEO?",
            answers: ["Elena Daly", "Jean M. Buckley", "Richard Bowens", "Becky Grant"],
            correctAnswer: 1),
        Question(
            question: "FBLA helps over how many members prepare for careers in business?",
            answers: ["230,000","300,000",
            "350,000",
            "375,000"],
            correctAnswer: 0),
        Question(
            question: "How many articles are in the FBLA Bylaws?",
            answers: ["9", "10", "12", "13"],
            correctAnswer: 3)
        //More instances of Question should be inside this array.
        //You need one instance of Question for each question in your quiz.
    ]
    
    //variables so that the current question and the score can be adjusted
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0
    
    //sets question to the first in the array after the screen is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentQuestion = questions[0]
        setQuestion()
        
    }


}

