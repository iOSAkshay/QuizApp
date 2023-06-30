//
//  ContentView.swift
//  QuizApp
//
//  Created by Akshay Nandane on 29/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        QuizView(questions: Question.allQuestions)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
