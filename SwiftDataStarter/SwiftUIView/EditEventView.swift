//
//  EditEventView.swift
//  SwiftDataStarter
//
//  Created by Darshan S on 17/02/24.
//

import SwiftUI

struct EditEventView: View {
    
    @Bindable var event: Event
    
    var body: some View {
        Form {
            TextField("Name Of Event",text: $event.name)
            TextField("Location",text: $event.location)
        }
        .navigationTitle("Edit Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditEventView()
//}
