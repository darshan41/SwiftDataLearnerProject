//
//  SwiftDataStarterApp.swift
//  SwiftDataStarter
//
//  Created by Darshan S on 17/02/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataStarterApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
