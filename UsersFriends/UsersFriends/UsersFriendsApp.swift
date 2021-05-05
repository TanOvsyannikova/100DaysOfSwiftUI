//
//  UsersFriendsApp.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 05.05.2021.
//

import SwiftUI

@main
struct UsersFriendsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
