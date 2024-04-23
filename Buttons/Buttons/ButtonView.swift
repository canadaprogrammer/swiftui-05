//
//  ButtonView.swift
//  Buttons
//
//  Created by Jungjin Park on 2024-04-23.
//

import SwiftUI

struct ButtonView: View {
    @State var count = 0
    var body: some View {
        VStack {
            Text("Welcome to your second view")
            Text("Current count value: \(count)")
            Button {
                count += 1
            } label: {
                Text("Tap to Increament count")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(Capsule())
            }
        }
        .navigationTitle("Button View")
    }
}

#Preview {
    NavigationStack {
        ButtonView()
    }
}
