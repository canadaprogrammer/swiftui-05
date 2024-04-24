//
//  ContentView.swift
//  LazyStacks
//
//  Created by Jungjin Park on 2024-04-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(1...10000, id: \.self) { item in
                        ListRow(id: item, type: "Horizontal")
                    }
                }
            }
            .frame(width: 200, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
