//
//  AnimatedShapes.swift
//  Drawing
//
//  Created by Татьяна Овсянникова on 27.03.2021.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct AnimatedShapes: View {
    @State private var insetAmount: CGFloat = 50
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 100, height: 100)
            .onTapGesture {
                withAnimation() {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
            }
    }
}

struct AnimatedShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedShapes()
    }
}
