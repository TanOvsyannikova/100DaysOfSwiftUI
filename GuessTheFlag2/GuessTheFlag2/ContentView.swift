//
//  ContentView.swift
//  GuessTheFlag2
//
//  Created by Татьяна Овсянникова on 03.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var animated = false
    @State var selected = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    @State private var counter = 1
    
    let totalQuestions = 10
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.7, green: 0.6, blue: 0.8), Color(red: 0.9, green: 0.5, blue: 0.6)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30){
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                ForEach (0 ..< 3) { number in
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.5)) {
                            self.animated = true
                        }
                        
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        flagTapped(number)
                    }
                    
                    
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .border(Color.gray, width: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .rotation3DEffect(.degrees(flagTappedIsCorrect(number) && animated ? 360 : 0.0), axis: (x: 0, y: 1, z: 0))
                            .opacity(!flagTappedIsCorrect(number) && animated ? 0.25 : 1)
                        
                        
                    }
                
            }
            
            Text("Your current score is: \(score)")
            Text("\(counter)/10")
        }
    }
    
    .alert(isPresented: $showingScore) {
    Alert(title: Text(scoreTitle), message: Text("Your final score is: \(score)"), dismissButton: .default(Text("Restart")) {
    score = 0
    self.askQuestion()
    })
    }
}

func flagTappedIsCorrect(_ number: Int) -> Bool {
    if number == correctAnswer {
        return true
    }
    return false
}



func flagTapped(_ number: Int) {
    if flagTappedIsCorrect(number) {
        score += 1
    }
    
    counter += 1
    
    if counter > totalQuestions {
        counter = 1
        showingScore = true
    }
    
    self.askQuestion()
}

func askQuestion() {
    animated = false
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
