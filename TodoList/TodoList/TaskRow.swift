//
//  TaskRow.swift
//  TodoList
//
//  Created by Jungjin Park on 2024-04-25.
//

import SwiftUI

struct TaskRow: View {
<<<<<<< HEAD
//    @State var completed = false
//    @State var priority: Priority
    @Binding var task: Task
    var body: some View {
        HStack {
//            Button {
//                task.completed.toggle()
//                print("task: \(task.completed)")
//            } label: {
                Image(systemName: task.completed ? "circle.fill" : "circle")
                    .foregroundStyle(.red)
//            }
=======
    @Binding var task: Task
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "circle.fill" : "circle")
                .foregroundStyle(.red)
>>>>>>> 0acffea11145d99e2efcac5ac413131b7e12d402
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
<<<<<<< HEAD
    TaskRow(task: .constant(Task.tasks[1]))
=======
    TaskRow(task: .constant(Task(completed: false, description: "Test", priority: .high)))
>>>>>>> 0acffea11145d99e2efcac5ac413131b7e12d402
}
