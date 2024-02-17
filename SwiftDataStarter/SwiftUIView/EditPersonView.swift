//
//  EditPersonView.swift
//  SwiftDataStarter
//
//  Created by Darshan S on 17/02/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditPersonView: View {
    
    @Environment(\.modelContext) var modelContext
    @Bindable var person: Person
    @Binding var navigationPath: NavigationPath
    @State private var selectedItem: PhotosPickerItem?
    
    @Query(sort: [
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
    ]) var events: [Event]
    
    var body: some View {
        Form {
            if let imageData = person.photo,let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            Section {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Label("Select a photo",systemImage: "person")
                }
            }
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                TextField("Email Address",text: $person.email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            Section("Where yu meet em?") {
                Picker("Met at",selection: $person.metAt) {
                    Text("Unknown Event")
                        .tag(Optional<Event>.none)
                    if !events.isEmpty {
                        Divider()
                        ForEach(events) { event in
                            Text(event.name)
                                .tag(Optional(event))
                        }
                    }
                }
                
                Button("Add a new event",action: addEvent)
            }
            Section("Notes") {
                TextField("Details",text: $person.details,axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Event.self) { event in
            EditEventView(event: event)
        }
        .onChange(of: selectedItem, loadPhoto)
    }
    
    func addEvent() {
        let event = Event(name: "",location: "")
        modelContext.insert(event)
        navigationPath.append(event)
    }
    
    func loadPhoto() {
        Task { @MainActor in
            person.photo = try await selectedItem?.loadTransferable(type: Data.self)
        }
    }
}


//#Preview {
//    EditPersonView(person: Person.self)
//}
