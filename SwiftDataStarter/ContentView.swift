//
//  ContentView.swift
//  SwiftDataStarter
//
//  Created by Darshan S on 17/02/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var path = NavigationPath()
    @State private var sortOrder = [SortDescriptor(\Person.name)]
    @Query var people: [Person]
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            PeopleView(searchString: searchText,sortOrder: sortOrder).navigationTitle("FaceFacts")
                .navigationDestination(for: Person.self) { person in
                    EditPersonView(person: person, navigationPath: $path)
                }.toolbar {
                    Menu("Sort",systemImage: "arrow.up.arrow.down") {
                        Picker("Sort",selection: $sortOrder) {
                            Text("Name (A-Z)")
                                .tag([SortDescriptor(\Person.name)])
                            Text("Name (A-Z)")
                                .tag([SortDescriptor(\Person.name,order: .reverse)])
                        }
                    }
                    Button("Add Person",systemImage: "plus",action: addPerson)
                }
                .searchable(text: $searchText)
        }
    }
    
    func addPerson() {
        let person = Person(name: "", email: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
}

//#Preview {
//    ContentView()
//}

/// add two numbers in function

func add() {
    
}
