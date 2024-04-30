//
//  NoteSummaryView.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-30.
//

import SwiftUI

struct NoteSummaryView: View {
    var note: Note
    private let format: Date.FormatStyle = .dateTime.month(.wide).day().year()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            Text("\(note.date, format: format)")
                .font(.subheadline)
        }
    }
}

#Preview {
    List(0..<5) { _ in
        NoteSummaryView(note: Note.sample)
    }
}
