//
//  TaskDetailView.swift
//  NightWatch
//
//  Created by Shubham Kumar on 16/01/22.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var task:Task
    var body: some View {
        VStack {
            Text(task.name)
            if task.isComplete == false {
                Button("Mark Completed"){
                    task.isComplete = true
                }.padding()
            } else {
                Button("Reset"){
                    task.isComplete = false
                }.padding()
            }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Binding<Task>.constant(Task(name: "Test Task", isComplete: false, lastCompleted: nil)))
    }
}
