//
//  ChallengesView.swift
//  CoreDataProject
//
//  Created by Татьяна Овсянникова on 03.05.2021.
//

import SwiftUI

struct ChallengesView: View {
    @Environment(\.managedObjectContext) var moc2
    @State private var titleFilter = "A"
    
    //first challenge
    private var sortBy = [NSSortDescriptor(key: "director", ascending: true), NSSortDescriptor(key: "title", ascending: true)]
    
    var body: some View {
        VStack {
            FilteredListChallenges(filterKey: "title", filterValue: titleFilter, sortDescriptors: sortBy) { (movie: Movie) in
                Text("\(movie.wrappedTitle) by \(movie.wrappedDirector)")
            }
            
            Button("Add Examples") {
                let first = Movie(context: self.moc2)
                first.director = "Alice"
                first.title = "Bob"
                first.year = 1999
                
                let second = Movie(context: self.moc2)
                second.director = "Brad"
                second.title = "Cool"
                second.year = 1999
                
                let third = Movie(context: self.moc2)
                third.director = "Angela"
                third.title = "Crown"
                third.year = 1999
                
                let fourth = Movie(context: self.moc2)
                fourth.director = "Angela"
                fourth.title = "City"
                fourth.year = 1999
                
                try? self.moc2.save()
            }
            
            Button("Show C") {
                self.titleFilter = "C"
            }
            
            Button("Show B") {
                self.titleFilter = "B"
            }
        }
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
