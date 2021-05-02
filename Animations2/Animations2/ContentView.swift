//
//  ContentView.swift
//  Animations2
//
//  Created by Татьяна Овсянникова on 15.03.2021.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello SwiftUI")
    
    @State private var isSwowing = false
    
    var body: some View {
        VStack{
//            LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .top, endPoint: .bottomTrailing)
//                .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .offset(dragAmount)
//                .gesture(
//                    DragGesture()
//                        .onChanged { self.dragAmount = $0.translation }
//                        .onEnded { _ in
//                            withAnimation(.spring()) {
//                                self.dragAmount = .zero }
//                        })
                //.animation(.spring())
                
            
            Button("Tap me") {
                self.enabled.toggle()
                withAnimation {
                    self.isSwowing.toggle()
                }

            }
            .frame(width: 200, height: 200, alignment: .center)
            .background(enabled ? Color.blue : Color.red)
            .animation(.default)
            .foregroundColor(.white)

            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))

            if isSwowing {
                HStack(spacing: 0) {
                    ForEach(0..<letters.count) { num in
                        Text(String (self.letters[num]))
                            .padding(5)
                            .font(.title)
                            .background(self.enabled ? Color.blue : Color.red)
                            .offset(dragAmount)
                            .animation(Animation.default.delay(Double(num) / 20))
                            .gesture(
                                DragGesture()
                                    .onChanged { self.dragAmount = $0.translation }
                                    .onEnded { _ in
                                        withAnimation(.spring()) {
                                            self.dragAmount = .zero
                                            self.enabled.toggle()
                                        }
                                    })
                            .transition(.pivot)                    }
            }
            }
            
        
    }
    
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
