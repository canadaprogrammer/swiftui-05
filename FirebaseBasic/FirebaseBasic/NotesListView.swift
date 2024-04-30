//
//  NotesListView.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-30.
//

import SwiftUI

struct NotesListView: View {
    @StateObject private var service: NotesService = NotesService()
    @State private var isNewNotePresented = false
    
    var body: some View {
        NavigationStack {
            List(service.notes) { note in
                NavigationLink(value: note) {
                    NoteSummaryView(note: note)
                }
            }
            .navigationDestination(for: Note.self) { note in
                NoteDetailView(note: note)
            }
            .navigationTitle("FireNotes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isNewNotePresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
                }
            }
            .sheet(isPresented: $isNewNotePresented) {
                AddNoteView(service: service)
            }
            .task {
                // 새로 고침
                service.fetch()
            }
        }
    }
}

#Preview {
    NotesListView()
}
