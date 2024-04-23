//
//  ContentView.swift
//  UsingImages
//
//  Created by Jungjin Park on 2024-04-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image("dogs1")
            Image(.dogs1)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(.dogAndNature)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .trailing)
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue, lineWidth: 10))
                .shadow(radius: 10)
            Image(uiImage: UIImage(resource: .dog2))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
