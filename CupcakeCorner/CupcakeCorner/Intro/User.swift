//
//  User.swift
//  CupcakeCorner
//
//  Created by Татьяна Овсянникова on 04.04.2021.
//


//this is an example on how to add Codable conformance for @Published properties
//this class is not used in the program

import Foundation

class User: Codable, ObservableObject {
    enum codingKeys: CodingKey {
        case name
    }
    
   @Published var name = ""
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
