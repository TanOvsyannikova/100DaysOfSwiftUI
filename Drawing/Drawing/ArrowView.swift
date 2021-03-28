//
//  Arrow.swift
//  Drawing
//
//  Created by Татьяна Овсянникова on 28.03.2021.
//

import SwiftUI

struct Arrow: InsettableShape {
    var insetAmount: CGFloat
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX / 2, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX * 1.5, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX * 1.5, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX / 2, y: rect.midY))
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ArrowView: View {
    @State private var insetAmount: CGFloat = 50
    
    var body: some View {
        Arrow(insetAmount: insetAmount)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: insetAmount))
            .onTapGesture {
                withAnimation() {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
    }
}
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow(insetAmount: 50)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 20))
            
    }
}
