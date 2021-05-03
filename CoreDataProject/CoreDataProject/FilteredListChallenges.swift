//
//  FilteredListChallenges.swift
//  CoreDataProject
//
//  Created by Татьяна Овсянникова on 03.05.2021.
//

import CoreData
import SwiftUI

struct FilteredListChallenges<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var movies: FetchedResults<T> { fetchRequest.wrappedValue }

    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { movie in
                    self.content(movie)
        }
    }
    
    init(predicate: Predicates = .beginsWith, filterKey: String, filterValue: String, sortDescriptors: [NSSortDescriptor] = [], @ViewBuilder content: @escaping (T) -> Content) {
        
            fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
            self.content = content
        }
}
