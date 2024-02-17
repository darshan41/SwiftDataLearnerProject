//
//  Event.swift
//  SwiftDataStarter
//
//  Created by Darshan S on 17/02/24.
//

import SwiftData

@Model
class Event {
    var name: String
    var location: String
    var person = [Person]()
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
