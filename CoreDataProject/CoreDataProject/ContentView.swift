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
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: [], predicate: NSPredicate(format: "name >= %@", "H")) var wizards: FetchedResults<Wizard>
    
    //let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    var body: some View {
//        List {
//            ForEach(students, id: \.self) { student in
//                Text(student.name)
//            }
//        }
        VStack {
                    List(wizards, id: \.self) { wizard in
                        Text(wizard.name ?? "Unknown")
                    }

                    Button("Add") {
                        let wizard = Wizard(context: self.moc)
                        wizard.name = "Harry Potter"
                        
                        let wizard2 = Wizard(context: self.moc)
                        wizard2.name = "Harry Pottah"
                        
                        let wizard3 = Wizard(context: self.moc)
                        wizard3.name = "Draco Malfoy"
                    }

                    Button("Save") {
                        if self.moc.hasChanges {
                            do {
                                try self.moc.save()
                            } catch {
                                print(error.localizedDescription)
                            }
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
