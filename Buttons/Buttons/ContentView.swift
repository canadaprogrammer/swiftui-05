//
//  ContentView.swift
//  Buttons
//
//  Created by Jungjin Park on 2024-04-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 44) {
                NavigationLink("Buttons") {
                    ButtonView()
                }
                NavigationLink("EditButtons") {
                    EditButtonView()
                }
                NavigationLink("MenuButtons") {
                    MenuButtonView()
                }
                NavigationLink("PasteButtons") {
                    PasteButtonView()
                }
                NavigationLink("Details about text") {
                    Text("Very long text that should not be deplayed in a single line because it is not good design.")
                        .padding()
                        .navigationTitle(Text("Details"))
                }
            }
            .navigationTitle(Text("Main View"))
        }
    }
}

#Preview {
    ContentView()
}
