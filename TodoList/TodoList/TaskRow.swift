//
//  TaskRow.swift
//  TodoList
//
//  Created by Jungjin Park on 2024-04-25.
//

import SwiftUI

struct TaskRow: View {
    @Binding var task: Task
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "circle.fill" : "circle")
                .foregroundStyle(.red)
            Text("\(task.description)")
            Spacer()
            Picker(selection: $task.priority, label: EmptyView()) {
                ForEach(Priority.allCases, id: \.self) { value in
                    Text("\(value)")
                }
            }
        }
    }
}

#Preview {
    TaskRow(task: .constant(Task(completed: false, description: "Test", priority: .high)))
}
