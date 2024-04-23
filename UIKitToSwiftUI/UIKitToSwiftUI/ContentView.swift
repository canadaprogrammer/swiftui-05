//
//  ContentView.swift
//  UIKitToSwiftUI
//
//  Created by Jungjin Park on 2024-04-23.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = true
    var body: some View {
        VStack {
            ActivityIndicator(animating: animate)
            HStack {
                Toggle(isOn: $animate) {
                    Text("Toggle Activity")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
