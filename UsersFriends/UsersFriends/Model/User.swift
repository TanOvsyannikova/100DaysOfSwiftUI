//
//  User.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 05.05.2021.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var active: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registrationDate: Date
    var friends: [Friend]
    var tags: [String]
}
