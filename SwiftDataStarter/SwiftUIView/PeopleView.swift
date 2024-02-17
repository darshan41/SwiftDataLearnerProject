//
//  PeopleView.swift
//  SwiftDataStarter
//
//  Created by Darshan S on 17/02/24.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var people: [Person]
    
    init(searchString: String = "",sortOrder: [SortDescriptor<Person>] = []) {
        _people = Query(filter: #Predicate { person in
            if searchString.isEmpty {
                return true
            } else {
                return person.name.localizedStandardContains(searchString)
                || person.email.localizedStandardContains(searchString)
                || person.details.localizedStandardContains(searchString)
            }
            
        }, sort: sortOrder, animation: .easeInOut)
    }
    
    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete { offsets in
                deletePerson(at: offsets)
            }
        }
    }
    
    func deletePerson(at offsets: IndexSet) {
        for offset in offsets {
            modelContext.delete(people[offset])
        }
    }
}

//#Preview {
//    PeopleView()
//}
