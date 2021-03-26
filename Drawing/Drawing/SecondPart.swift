//
//  SwiftUIView.swift
//  Drawing
//
//  Created by Татьяна Овсянникова on 26.03.2021.
//

import SwiftUI

struct Flower: Shape {
    var petalOffset: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct SecondPart: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                //.stroke(Color.red, lineWidth: 1)
                .fill(Color.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
                .frame(width: 100, height: 100)
                .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 10)
            
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            ZStack {
                Text("Width")
                Capsule()
                    .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
                    .frame(width: 150, height: 90)
            }
            Slider(value: $petalWidth, in: 0...100)
                .padding([.horizontal, .bottom])
        }
    }
}

struct SecondPart_Previews: PreviewProvider {
    static var previews: some View {
        SecondPart()
    }
}
