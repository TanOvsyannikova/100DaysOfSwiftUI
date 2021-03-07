//
//  ContentView.swift
//  RockPaperScissorsGame
//
//  Created by Татьяна Овсянникова on 07.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var buttons = ["🪨", "✂️", "📄"]
    
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var userWins = Bool.random()
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    @State private var counter = 1
    
    let totalQuestions = 10
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 40) {
                Text("Your opponent's turn:")
                Text("\(buttons[currentChoice])")
                    .font(.system(size: 50))
                
                Text("Now try to " + (userWins ? "Win this game" : "Lose this game"))
                
                HStack(spacing: 30) {
                    ForEach (0..<3) { number in
                        Button(action: {
                            buttonTapped(number)
                        }) {
                            Text(self.buttons[number]).font(.system(size: 50))
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    }
                }
                
                
                Text("Your current score is: \(score)")
                Text("\(counter)/10")
            }
            .font(.title)
        }
        .alert(isPresented: $showingScore) {
                    Alert(title: Text(scoreTitle), message: Text("Your final score is: \(score)"), dismissButton: .default(Text("Restart")) {
                        score = 0
                        self.askQuestion()
                    })
        }
    }
    
    
    
    func buttonTapped(_ number: Int) {
        
        if userWins {
            if (currentChoice == 0 && number == 2) || (currentChoice == 1 && number == 0) || (currentChoice == 2 && number == 1) {
                score += 1
            }
        } else {
            if (currentChoice == 0 && number == 1) || (currentChoice == 1 && number == 2) || (currentChoice == 2 && number == 0) {
                score += 1
            }
        }
        
        
        counter += 1
               
               if counter > totalQuestions {
                   counter = 1
                   showingScore = true
               }
        
        self.askQuestion()
    }
    
    
    func askQuestion() {
        currentChoice = Int.random(in: 0...2)
        userWins = Bool.random()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
