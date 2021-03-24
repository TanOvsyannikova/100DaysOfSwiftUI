//
//  AstronautView.swift
//  Moonshot
//
//  Created by Татьяна Овсянникова on 23.03.2021.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var missionsFlown = [String]()

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                    
                    Text("Missions: ")
                        .padding()
                        .font(.headline)
                    
                    ForEach(self.missionsFlown, id: \.self) { mission in
                        VStack {
                            Text(mission.description)
                                .font(.headline)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        var matches = [String]()
        
        for mission in missions {
            for _ in mission.crew {
                if let match = mission.crew.first(where: {$0.name == astronaut.id}) {
                    matches.append("Apollo \(mission.id) - \(match.role)")
                    break
                }
            }
        }
        self.missionsFlown = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
