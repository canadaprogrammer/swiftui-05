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
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1...10000, id: \.self) { item in
                        ListRow(id: item, type: "Horizontal")
                    }
                }
            }
            .frame(height: 100, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
