//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Татьяна Овсянникова on 07.03.2021.
//

import SwiftUI

struct RockPaperScissorsGameView: View {
    @ObservedObject var viewModel: RockPaperScissorsGame
    
    var body: some View {
        VStack() {
            Text("Your score is: ")
            Text("")
            
            HStack(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                
            }
        }
    }
}

struct  CardView: View {
    var card: RockPaperScissorsGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body (for size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color.blue)
            Text(card.content)
    }
}
    func fontSize (for size: CGSize) -> CGFloat {
            min(size.width , size.height) * 0.75
        }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissorsGameView()
    }
}
