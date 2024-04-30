//
//  AddCommentView.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-30.
//

import SwiftUI

struct AddCommentView: View {
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel.shared
    
    @State private var bodyText: String = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            TextEditor(text: $bodyText)
                .border(.gray)
        }
        .padding(24)
        .navigationTitle("Add Comment")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await addComment()
                        dismiss()
                    }
                } label: {
                    Image(systemName: "checkmark")
                        .disabled(bodyText.isEmpty)
                }
            }
        }
    }
    
    func addComment() async {
        
    }
}

#Preview {
    NavigationStack {
        AddCommentView()
    }
}
