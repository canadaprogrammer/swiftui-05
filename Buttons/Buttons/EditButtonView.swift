//
//  EditButtonView.swift
//  Buttons
//
//  Created by Jungjin Park on 2024-04-23.
//

import SwiftUI

struct EditButtonView: View {
    @State var animals = ["Cats", "Dogs", "Goats"]
    var body: some View {
        List {
            ForEach(animals, id: \.self) { animal in
                Text(animal)
            }
            .onDelete(perform: removeAnimal)
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("EditButton View")
    }
    
    func removeAnimal(at offsets: IndexSet) {
        animals.remove(atOffsets: offsets)
    }
}

#Preview {
    NavigationStack {
        EditButtonView()
    }
}
