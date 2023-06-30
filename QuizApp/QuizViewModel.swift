//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Akshay Nandane on 30/06/23.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let options: [String]
    let correctAnswerIndex: Int
    
    static let allQuestions: [Question] = [
        Question(text: "What is the capital of France?", options: ["London", "Paris", "Rome", "Berlin"], correctAnswerIndex: 1),
        Question(text: "Which planet is known as the Red Planet?", options: ["Venus", "Mars", "Jupiter", "Mercury"], correctAnswerIndex: 1),
        Question(text: "Who painted the Mona Lisa?", options: ["Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Michelangelo"], correctAnswerIndex: 0)
    ]
}
