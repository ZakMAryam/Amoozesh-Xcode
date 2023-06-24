//
//  VocabularyQuizBrain.swift
//  ILearn
//
//  Created by Zakia Maryam Najafizada on 6/7/23.
//

import Foundation
import UIKit

struct GrammarQuestions: Codable {
    let question: String
    var answers: [String]
    let correctAnswer: String
}

struct GrammarQuizBrian {
    private static let quizProgressKey = "GrammarQuizProgress"
    
    var questionNumber = 0
    var score = 0
    
    let quiz: [GrammarQuestions]
    
    init() {
        if let savedProgress = UserDefaults.standard.dictionary(forKey: GrammarQuizBrian.quizProgressKey),
           let questionNumber = savedProgress["questionNumber"] as? Int,
           let score = savedProgress["score"] as? Int {
            self.questionNumber = questionNumber
            self.score = score
        }
        
        if let url = Bundle.main.url(forResource: "grammar", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let quizData = try? JSONDecoder().decode([GrammarQuestions].self, from: data) {
            // Randomize the answers for each question
            let randomizedQuizData = quizData.map { var question = $0; question.answers = question.answers.shuffled(); return question }
            quiz = randomizedQuizData
        } else {
            quiz = []
        }
    }
    
    func getQuestionText() -> String {
        if questionNumber < quiz.count {
            return quiz[questionNumber].question
        } else {
            return "No question available"
        }
    }
    
    func getAnswers() -> [String] {
        if questionNumber < quiz.count {
            return quiz[questionNumber].answers
        } else {
            return []
        }
    }
    
    func getProgress() -> Float {
        if quiz.isEmpty {
            return 0.0
        } else {
            return Float(questionNumber) / Float(quiz.count)
        }
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() -> Bool {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            saveProgress()
            return true
        } else {
            questionNumber = 0
            score = 0
            saveProgress()
            return false
        }
    }
    mutating func restartQuiz() {
        questionNumber = 0
        score = 0
    }
    mutating func getQuiz() -> Int{
        return quiz.count
    }

    mutating func checkAnswer(userAnswer: String) -> Bool {
        if questionNumber < quiz.count && userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            saveProgress()
            return true
        } else {
            return false
        }
    }
    
    
    private func saveProgress() {
        let progress = [
            "questionNumber": questionNumber,
            "score": score
        ]
        UserDefaults.standard.set(progress, forKey: GrammarQuizBrian.quizProgressKey)
    }
}


