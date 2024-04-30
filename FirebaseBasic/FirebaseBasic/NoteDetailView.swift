//
//  NoteDetailView.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-30.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    var body: some View {
        VStack(spacing: 20) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            TextEditor(text: .constant(note.body))
                .border(.gray)
        }
        .padding(24)
    }
}

#Preview {
    NoteDetailView(note: Note.sampleWithLongBody)
}
