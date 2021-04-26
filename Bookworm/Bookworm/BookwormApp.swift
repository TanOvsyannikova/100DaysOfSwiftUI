//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Татьяна Овсянникова on 26.04.2021.
//

import SwiftUI

@main
struct BookwormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
