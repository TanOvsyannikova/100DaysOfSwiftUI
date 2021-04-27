//
//  Bookworm2App.swift
//  Bookworm2
//
//  Created by Татьяна Овсянникова on 27.04.2021.
//

import SwiftUI

@main
struct Bookworm2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
