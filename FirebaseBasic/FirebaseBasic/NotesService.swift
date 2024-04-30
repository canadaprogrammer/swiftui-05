//
//  NoteService.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-29.
//

import Foundation
import FirebaseFirestore

//@MainActor
class NotesService: ObservableObject {
    @Published var notes: [Note]
    private let dbCollection = Firestore.firestore().collection("notes")
    private var listener: ListenerRegistration?
    
    init(notes: [Note] = []) {
        self.notes = notes
        startRealtieUpdate()
    }
    
    func fetch() {
        guard listener == nil else { return }
        // snapshot: 목록
        dbCollection.getDocuments { [self] querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            updateNotes(snapshot: snapshot)
        }
    }
    
    func addNote(title: String, date: Date, body: String) {
        let note = Note(id: UUID().uuidString, title: title, date: date, body: body)
        // 문제가 생기면 오류 발생
        _ = try? dbCollection.addDocument(from: note)
        fetch()
    }
    
    private func startRealtieUpdate() {
        listener = dbCollection.addSnapshotListener { [self] querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshot: \(error!)")
                return
            }
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print("New note: \(diff.document.data())")
                }
                if (diff.type == .modified) {
                    print("Modified note: \(diff.document.data())")
                }
                if (diff.type == .removed) {
                    print("Removed note: \(diff.document.data())")
                }
            }
            updateNotes(snapshot: snapshot)
        }
    }
    
    private func updateNotes(snapshot: QuerySnapshot) {
        let notes: [Note] = snapshot.documents.compactMap { document in
            try? document.data(as: Note.self)
        }
        // firebase 는 nosql 이라 무작위로 데이터를 줌
        self.notes = notes.sorted {
            $0.date < $1.date
        }
    }
}
