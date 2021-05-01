//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Татьяна Овсянникова on 01.05.2021.
//
import CoreData
import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Movie>
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { movie in
            Text("\(movie.wrappedTitle) \(movie.wrappedDirector)")
            }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Movie>(entity: Movie.entity(), sortDescriptors: [], predicate: NSPredicate(format: "title BEGINSWITH %@", filter))
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(filter: "A")
    }
}
