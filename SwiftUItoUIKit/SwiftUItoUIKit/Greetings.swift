//
//  Greetings.swift
//  SwiftUItoUIKit
//
//  Created by Jungjin Park on 2024-04-24.
//

import SwiftUI

struct Greetings: View {
    var textFromUIKit: String
    var body: some View {
        Text(textFromUIKit)
    }
}

#Preview {
    Greetings(textFromUIKit: "Hello, world!")
}
