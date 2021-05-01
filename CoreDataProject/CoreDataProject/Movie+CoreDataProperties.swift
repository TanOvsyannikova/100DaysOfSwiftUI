//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Татьяна Овсянникова on 30.04.2021.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

//    public var wrappedTitle: String {
//        title ?? "Unknown Title"
//    }
    
    var wrappedTitle: String {
        title ?? "Unknown"
    }

    var wrappedDirector: String {
        director ?? "Unknown"
    }
}

extension Movie : Identifiable {

}
