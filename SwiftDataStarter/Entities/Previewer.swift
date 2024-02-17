//
//  Previewer.swift
//  SwiftDataStarter
//
//  Created by Darshan S on 17/02/24.
//

import SwiftData
import Foundation

@MainActor
struct Previewer {
    let container: ModelContainer
    let event: Event
    let person: Person
    
    init() throws {
        let config = ModelConfiguration.init(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)
        event = Event(name: "Dime", location: "las vegas")
        person = Person(name: "davey", email: "davey@f.in", details: "asd", metAt: event)
        container.mainContext.insert(person)
    }
}
