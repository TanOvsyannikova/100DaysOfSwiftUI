//
//  ContentView.swift
//  Animations
//
//  Created by Татьяна Овсянникова on 14.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var animationAmountFor3DEffect = 0.0
    
    var body: some View {
        
         VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(
//                Animation.easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//
//            Spacer()
            
            Button("Tap me") {
             //   self.animationAmount += 1
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.animationAmountFor3DEffect += 360
                }
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
//            .scaleEffect(animationAmount)
            //.blur(radius: (animationAmount - 1) * 3)
            //.animation(.easeOut)
            //.animation(.default)
            //.animation(.interpolatingSpring(stiffness: 50, damping: 1))
            //.animation(.easeInOut(duration: 2))
            
            
//            .overlay(
//                Circle()
//                    .stroke(Color.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(Double(2 - animationAmount))
//                    .animation(
//                        Animation.easeInOut(duration: 1)
//                            .repeatForever(autoreverses: false)
//
//                    )
//            )
//            .onAppear {
//                self.animationAmount = 2
//            }
            
            
    //        .animation(
    //            Animation.easeInOut(duration: 2)
    //                .delay(1)
    //                .repeatCount(2, autoreverses: true)
    //                .repeatForever(autoreverses: true)
    //        )
            
            .rotation3DEffect(
                .degrees(animationAmountFor3DEffect),
                axis: (x: 0.0, y: 1.0, z: 0.0))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
