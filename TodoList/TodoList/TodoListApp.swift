//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jungjin Park on 2024-04-25.
//

import SwiftUI

@main
struct TodoListApp: App {
    @State var tasks = Task.tasks
    var body: some Scene {
        WindowGroup {
            ContentView(tasks: $tasks)
        }
    }
}
