//
//  Intro.swift
//  Bookworm
//
//  Created by Татьяна Овсянникова on 26.04.2021.
//


import SwiftUI


// this is an example of creating a custom component

//struct PushButton: View {
//    let title: String
//    @Binding var isOn: Bool
//
//    var onColors = [Color.red, Color.yellow]
//        var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//        var body: some View {
//            Button(title) {
//                self.isOn.toggle()
//            }
//            .padding()
//            .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//            .shadow(radius: isOn ? 0 : 5)
//        }
//}

struct IntroView: View {
    //@State private var rememberMe = false
    
    @Environment(\.horizontalSizeClass) var sizeClass


    var body: some View {
        //using the custom component
        
//        VStack {
//            PushButton(title: "Remember me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
        
        
        //using size classes with AnyType view erasure
        if sizeClass == .compact {
                    return AnyView(VStack { //type erased wrapper
                        Text("Active size class:")
                        Text("COMPACT")
                    }
                    .font(.largeTitle))
                } else {
                    return AnyView(HStack {
                        Text("Active size class:")
                        Text("REGULAR")
                    }
                    .font(.largeTitle))
                }
    }

}



struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
