//
//  ContentView.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 05.05.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var users = Users()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.all) { person in
                    NavigationLink(destination: UserView(users: users, user: person)) {
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .font(.headline)
                            Text(person.isActive ? "Online" : "Offline")
                                .font(.subheadline)
                                .foregroundColor(person.isActive ? .green : .gray)
                        }
                    }
                }
            }
            .navigationBarTitle("All users")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static let user1 = User(id: "1", isActive: true, name: "John", age: 32, company: "Apple LLC", email: "apple@", address: "Cupertino", about: "Cool guy", registered: "", friends: [], tags: [])
    
    static var previews: some View {
        ContentView(users: Users(users: [user1]))
    }
}
