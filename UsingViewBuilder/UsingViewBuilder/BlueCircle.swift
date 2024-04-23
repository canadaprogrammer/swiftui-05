//
//  BlueCircle.swift
//  UsingViewBuilder
//
//  Created by Jungjin Park on 2024-04-23.
//

import SwiftUI

struct BlueCircle<Content:View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 30)
        }
    }
}

//#Preview {
//    BlueCircle()
//}
