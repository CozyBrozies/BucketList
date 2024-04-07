//
//  EditView.swift
//  BucketList
//
//  Created by Isaac Herskowitz on 4/5/24.
//

import SwiftUI
import Foundation

/*
 where used can see and adjust a location’s name and description. This needs to receive a location to edit, allow the user to adjust the two values for that location, then will send back a new location
 */

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var location: Location
    
    var onSave: (Location) -> Void
    
    @State private var name: String
    @State private var description: String

    var body: some View {
        
        NavigationStack{
            Form{
                Section{
                    TextField("Place Name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description

                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

#Preview {
    EditView(location: .example) { _ in }
}
