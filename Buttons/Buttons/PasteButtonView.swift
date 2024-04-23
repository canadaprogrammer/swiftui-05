//
//  PasteButtonView.swift
//  Buttons
//
//  Created by Jungjin Park on 2024-04-23.
//

import SwiftUI

struct PasteButtonView: View {
    @State var text = ""
    var body: some View {
        VStack {
            Text(text)
            PasteButton(payloadType: String.self) { strings in
                guard let string = strings.first else { return }
                
                text = string
            }
            .buttonBorderShape(.capsule)
            .labelStyle(.iconOnly)
            .tint(.red)
        }
    }
}

#Preview {
    NavigationStack {
        PasteButtonView()
    }
}
