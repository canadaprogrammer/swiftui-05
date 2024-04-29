//
//  NoteService.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-29.
//

import Foundation
import FirebaseFirestore

@MainActor
class NotesService: ObservableObject {
    @Published var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    func fetch() {
        
    }
    
    func addNote(title: String, date: Date, body: String) {
        
    }
    
    private func startRealtieUpdate() {
        
    }
    
    private func updateNotes(snapshot: QuerySnapshot) {
        
    }
}
