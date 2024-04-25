//
//  ContentView.swift
//  DisclosureGroups
//
//  Created by Jungjin Park on 2024-04-25.
//

import SwiftUI

struct ContentView: View {
    @State private var showplanets = true
    var body: some View {
        VStack {
            DisclosureGroup(isExpanded: $showplanets) {
                Text("Mercury")
                Text("Venus")
                DisclosureGroup("Earth") {
                    Text("North America")
                    Text("South America")
                    Text("Europe")
                    Text("Africa")
                    Text("Asia")
                    Text("Antarctica")
                    Text("Oceania")
                }
            } label: {
                Text("Planets")
            }
            DisclosureGroup {
                Text("Surprise! This is an alternative way of using DisclosureGroup")
            } label: {
                Label("Tap to reveal", systemImage: "cube.box")
                    .font(.system(size: 25, design: .rounded))
                    .foregroundStyle(.green)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
