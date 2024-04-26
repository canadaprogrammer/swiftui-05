//
//  SecondView.swift
//  PreviewingInNavigationStack
//
//  Created by Jungjin Park on 2024-04-26.
//

import SwiftUI

struct SecondView: View {
    var someText: String
    var body: some View {
        Text(someText)
            .navigationTitle("Second View")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SecondView(someText: "This is the second view")
    }
}
