//
//  ContentView.swift
//  TodoList
//
//  Created by Jungjin Park on 2024-04-25.
//

import SwiftUI

struct ContentView: View {
    @Binding var tasks: [Task]
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    Button {
                        tasks[index].completed.toggle()
                    } label: {
                        TaskRow(task: $tasks[index])
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    tasks.remove(atOffsets: indexSet)
                })
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
//                ToolbarItem(placement: .bottomBar) {
//                    Button("Add") {
//                        AddTaskView()
//                    }
//                }
            }
            .navigationTitle("Todo List")
        }
        
    }
}

#Preview {
    ContentView(tasks: .constant(Task.tasks))
}
