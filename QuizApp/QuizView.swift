//
//  QuizView.swift
//  QuizApp
//
//  Created by Akshay Nandane on 30/06/23.
//

import SwiftUI

struct QuizView: View {
    let questions: [Question]
    @State private var currentQuestionIndex = 0
    @State private var userAnswers: [Bool] = []
    @State private var IsAnswerSelected = false
    @State private var IsPreviousAvailable = false
    
    var body: some View {
        VStack {
            Spacer()
            Text(questions[currentQuestionIndex].text)
                .font(.headline)
                .padding()
            
            Spacer()
            Divider()
                .frame(height: 1)
                .overlay(.gray)
            
            VStack {
                ForEach(0..<questions[currentQuestionIndex].options.count) { optionIndex in
                    Button(action: {
                        checkAnswer(optionIndex)
                        IsAnswerSelected = true
                    }
                    ) {
                        Text(questions[currentQuestionIndex].options[optionIndex])
                            .frame(maxWidth: .infinity)
                            .padding()
                            .border(.red)
                            .font(.body)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(5)
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: false)
            
            Spacer()
            
            HStack {
                
                Button(action: previousQuestion) {
                    Text("Previous")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        .opacity(currentQuestionIndex != 0 ? 1 : 0)
                }
                
                Spacer()
                
                Button(action:
                        nextQuestion
                ) {
                    Text(currentQuestionIndex == questions.count-1 ? "Submit" : "Next")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        .opacity(IsAnswerSelected ? 1 : 0)
                }
//                .disabled(<#T##Bool#>)
            }
        }
        .padding()
    }
    
    func checkAnswer(_ selectedOptionIndex: Int) {
        let isCorrect = selectedOptionIndex == questions[currentQuestionIndex].correctAnswerIndex
        userAnswers.append(isCorrect)
    }
    
    func nextQuestion() {
        print("Next Button Tapped")
        IsAnswerSelected = false
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            // Quiz ended, do something here like showing the final score
        }
    }
    
    func previousQuestion() {
        print("Previous Button Tapped")
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
        } else {
            
        }
    }
}

struct QuizView_Preview: PreviewProvider {
    static var previews: some View {
        QuizView(questions: Question.allQuestions)
    }
}
