//
//  ContentView.swift
//  TodoList
//
//  Created by Jungjin Park on 2024-04-25.
//

import SwiftUI

struct ContentView: View {
    @State var tasks: [Task]
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    Button {
                        task.completed.toggle()
                    } label: {
                        TaskRow(priority: task.priority, task: task)
                    }
                }
                .onDelete(perform: { indexSet in
                    tasks.remove(atOffsets: indexSet)
                })
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Todo List")
        }
        
    }
}

#Preview {
    ContentView(tasks: Task.tasks)
}
