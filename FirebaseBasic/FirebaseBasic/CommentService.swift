//
//  CommentService.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-30.
//

import Foundation
import FirebaseFirestore

class CommentService: ObservableObject {
    @Published var comments: [Comment] = []
    
    private let noteId: String
    private let dbCollection: Collection
    
    init(noteId: String) {
        self.dbCollection = Firestore.firestore().collection("notes/\(noteId)")
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
    
    private func updateNotes(snapshot: QuerySnapshot) {
        let comments: [Comment] = snapshot.documents.compactMap { document in
//            try? document.data(as: Note.self)
            var comment = try? document.data(as: Comment.self)
            comment?.docId = document.documentID
            return comment
        }
        // firebase 는 nosql 이라 무작위로 데이터를 줌
        self.comments = comments.sorted {
            $0.date > $1.date
        }
    }
}
