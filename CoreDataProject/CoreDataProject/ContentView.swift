//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Татьяна Овсянникова on 30.04.2021.
//

import SwiftUI
import CoreData

struct  Student: Hashable {
    let name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    var body: some View {
        List {
            ForEach(students, id: \.self) { student in
                Text(student.name)
            }
        }
        Button("Save"){
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }
    }

    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
