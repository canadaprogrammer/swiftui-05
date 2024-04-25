//
//  ContentView.swift
//  ExpandingLists
//
//  Created by Jungjin Park on 2024-04-25.
//

import SwiftUI

struct ContentView: View {
    let bagContents = [currencies, tools]
    var body: some View {
        List(bagContents, children: \.content) { row in
            Label(row.name, systemImage: row.icon)
        }
    }
}

#Preview {
    ContentView()
}
