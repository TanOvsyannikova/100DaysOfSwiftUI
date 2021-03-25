//
//  ContentView.swift
//  Drawing
//
//  Created by Татьяна Овсянникова on 25.03.2021.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
                //path.addLine(to: CGPoint(x: 100, y: 300))
            }
            //.fill(Color.blue)
            //.stroke(Color.red.opacity(0.25), lineWidth: 10)
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            
            
            Triangle()
                //.fill(Color.red)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(Color.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
            
            //Circle()
            //  .strokeBorder(Color.blue, lineWidth: 40)
            
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(Color.blue, lineWidth: 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
