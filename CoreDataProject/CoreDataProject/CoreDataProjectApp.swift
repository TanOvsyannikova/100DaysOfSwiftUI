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
            ChallengesView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
