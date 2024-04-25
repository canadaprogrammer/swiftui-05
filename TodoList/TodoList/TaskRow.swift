//
//  TaskRow.swift
//  TodoList
//
//  Created by Jungjin Park on 2024-04-25.
//

import SwiftUI

struct TaskRow: View {
    @State var completed = false
    @State var priority: Priority
    var task: Task
    var body: some View {
        HStack {
            Button {
                completed.toggle()
            } label: {
                Image(systemName: completed ? "circle.fill" : "circle")
                    .foregroundStyle(.red)
            }
            Text("\(task.description)")
            Spacer()
            Picker(selection: $priority, label: EmptyView()) {
                ForEach(Priority.allCases, id: \.self) { value in
                    Text("\(value)")
                }
            }
        }
    }
}

#Preview {
    TaskRow(priority: .medium, task: Task.tasks[1])
}
