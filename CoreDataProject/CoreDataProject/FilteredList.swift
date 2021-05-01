//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Татьяна Овсянникова on 01.05.2021.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var movies: FetchedResults<T> { fetchRequest.wrappedValue }

    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { movie in
                    self.content(movie)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
            fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
            self.content = content
        }
}

