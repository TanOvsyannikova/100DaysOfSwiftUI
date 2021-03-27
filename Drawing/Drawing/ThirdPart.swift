//
//  ThirdPart.swift
//  Drawing
//
//  Created by Татьяна Овсянникова on 27.03.2021.
//

import SwiftUI

struct ThirdPart: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        //        ZStack {
        //            Image("Example2")
        //
        //            Rectangle()
        //                .fill(Color.red)
        //                .blendMode(.multiply)
        //        }
        //        .frame(width: 400, height: 500)
        //        .clipped()
        
        //Image("Example2")
        //.colorMultiply(.blue)
        
        VStack {
//            ZStack {
                //                Circle()
                //                    .fill(Color.red)
                //                    .frame(width: 200 * amount)
                //                    .offset(x: -50, y: -80)
                //                    .blendMode(.screen)
                //
                //                Circle()
                //                    .fill(Color.green)
                //                    .frame(width: 200 * amount)
                //                    .offset(x: 50, y: -80)
                //                    .blendMode(.screen)
                //
                //                Circle()
                //                    .fill(Color.blue)
                //                    .frame(width: 200 * amount)
                //                    .blendMode(.screen)
                //            }
                //            .frame(width: 300, height: 300)
                
                Image("Example2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .saturation(Double(amount))
                    .blur(radius: (1 - amount) * 20)
                
                Slider(value: $amount)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
        
    }
    
    struct ThirdPart_Previews: PreviewProvider {
        static var previews: some View {
            ThirdPart()
        }
    }
