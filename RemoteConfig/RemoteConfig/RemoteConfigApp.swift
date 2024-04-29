//
//  RemoteConfigApp.swift
//  RemoteConfig
//
//  Created by Jungjin Park on 2024-04-29.
//

import SwiftUI
import Firebase

@main
struct RemoteConfigApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
