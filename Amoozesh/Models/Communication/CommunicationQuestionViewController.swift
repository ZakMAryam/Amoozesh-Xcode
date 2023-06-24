//
//  CommunicationQuestionViewController.swift
//  ILearn
//
//  Created by Zakia Maryam Najafizada on 6/18/23.
//

import UIKit

class CommunicationQuestionViewController: UIViewController {
    
  
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!

    @IBOutlet weak var progressBar: UIProgressView!
    
    var communicationQuizBrain = CommunicationQuizBrian()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupBackButton()

     
    }
    func setupBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = .systemGreen
        self.navigationItem.leftBarButtonItem = backButton
        
    }

    @objc func backButtonPressed() {

        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController

        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal

        present(controller, animated: true , completion: nil)

    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = communicationQuizBrain.checkAnswer(userAnswer: userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if communicationQuizBrain.nextQuestion() == false {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            
            present(controller, animated: true , completion: nil)
            
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI() {
        questionLabel.text = communicationQuizBrain.getQuestionText()
        
        let answerChoice = communicationQuizBrain.getAnswers()
        choice1.setTitle(answerChoice[0], for: .normal)
        choice2.setTitle(answerChoice[1], for: .normal)
        choice3.setTitle(answerChoice[2], for: .normal)
        
        
        scoreLabel.text = ("Score \(communicationQuizBrain.getScore()) / \(communicationQuizBrain.getQuiz())" )
        progressBar.progress = communicationQuizBrain.getProgress()
        
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        communicationQuizBrain.restartQuiz()
        updateUI()
    }
    

}
