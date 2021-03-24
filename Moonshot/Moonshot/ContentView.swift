//
//  ContentView.swift
//  Moonshot
//
//  Created by Татьяна Овсянникова on 21.03.2021.
//

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var showDate = true
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(
                    destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if self.showDate {
                            Text(mission.formattedLaunchDate)
                                .font(.subheadline)
                        } else {
                            Text(mission.showCrew(astronauts: astronauts))
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showDate.toggle()
                                    }, label: {
                                        Text("Show \(self.showDate ? "crew" : "date")")
                                    })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
