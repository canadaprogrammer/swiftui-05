//
//  NoteDetailView.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-30.
//

import SwiftUI
import FirebaseFirestore

struct NoteDetailView: View {
    @StateObject var service: CommentService = CommentService(noteId: self.note.docId!)
    var note: Note
    
    var body: some View {
        VStack(spacing: 20) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            TextEditor(text: .constant(note.body))
                .border(.gray)
//            List {
//                ForEach(comments, id: \.self) { comment in
//                    Text("\(comment["text"] ?? "")")
//                }
//            }
        }
        .padding(24)
        .navigationTitle("Note Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: { AddCommentView(note: note)
                }, label: {
                    Label("Add Comment", systemImage: "bubble.left.and.text.bubble.right.fill")
                })
                .padding()
                .border(.gray)
            }
        }
        .task {
            loadComments()
        }
    }
    func loadComments() {
        let collection = Firestore.firestore().collection("/notes/\(note.docId!)/comments")
        collection.getDocuments { [self] querySnapshot, error in
            self.comments = querySnapshot?.documents.map { $0.data() } ?? []
            print("comments: \(comments.count)")
        }
    }
}

#Preview {
    NavigationStack {
        NoteDetailView(note: Note.sampleWithLongBody)
    }
}
