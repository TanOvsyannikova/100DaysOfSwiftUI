//
//  Habit.swift
//  HabitsTracking
//
//  Created by Татьяна Овсянникова on 04.04.2021.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    
    var title: String {
        didSet { lastModifiedDate = Date() }
    }
    
    var description: String {
        didSet { lastModifiedDate = Date() }
    }
    
    var lastModifiedDate = Date()
    
    var timesComplited: Int = 0 {
        didSet {
            lastModifiedDate = Date()
            if timesComplited < 0 {
                timesComplited = 0
            }
        }
    }
}
