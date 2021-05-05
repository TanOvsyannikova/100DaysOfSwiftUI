//
//  ContentView.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 05.05.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        List(users) { user in
            NavigationLink(destination: UserView(user: user)) {
                VStack {
                    Text(user.name)
                        .font(.headline)
                    Text(user.active ? "Online" : "Offline")
                        .font(.subheadline)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
