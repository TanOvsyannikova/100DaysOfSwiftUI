//
//  User.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 05.05.2021.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var friends: [Friend]
    var tags: [String]
}
