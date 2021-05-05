//
//  UserView.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 05.05.2021.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var users: Users
    let user: User
    
    var body: some View {
        List {
            Section(header: Text("Name")) {
                Text(user.name)
            }
            Section(header: Text("Age")) {
                Text(String(user.age))
            }
            Section(header: Text("Company")) {
                Text(user.company)
            }
            Section(header: Text("Email")) {
                Text(user.email)
            }
            Section(header: Text("Address")) {
                Text(user.address)
            }
            Section(header: Text("Friends")) {
    
            }
        }
        .navigationBarTitle("\(user.name)", displayMode: .inline)
    }
    
}

struct UserView_Previews: PreviewProvider {
    static let user1 = User(id: "1", isActive: true, name: "John", age: 32, company: "Apple LLC", email: "apple@", address: "Cupertino", about: "Cool guy", registered: "", friends: [], tags: [])
    
    static var previews: some View {
        UserView(users: Users(), user: user1)
    }
}
