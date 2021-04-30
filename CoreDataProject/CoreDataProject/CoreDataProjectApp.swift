//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Татьяна Овсянникова on 30.04.2021.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
