//
//  ContentView.swift
//  NightWatch
//
//  Created by Shubham Kumar on 15/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var nightWatchTasks: NightWatchTasks
    @State private var focusModeOn = false
    @State private var resetAlertShowing = false
    
    var body: some View {
        NavigationView {
            List {
                // MARK: Nightly Tasks
                Section(header: SectionHeaderView(imageSymbolName: "moon.stars", sectionHeaderName: "Nightly Tasks")
                ) {
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, index in
                        let nightWatchTaskWrapper = $nightWatchTasks
                        let taskBinding = nightWatchTaskWrapper.nightlyTasks
                        let theTaskBinding = taskBinding[index]
                        if focusModeOn == false || (focusModeOn && task.isComplete == false){
                            NavigationLink(destination: TaskDetailView(task: theTaskBinding), label:{ TaskRowView(task: task)})
                        }
                        
                    }).onDelete(perform: {
                        indexSet in nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: {indices, newOffset in nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)})
                }
                
                // MARK: Weekly Tasks
                Section(header: SectionHeaderView(imageSymbolName: "sunset", sectionHeaderName: "Weekly Tasks")) {
                    let taskIndices = nightWatchTasks.weeklyTasks.indices
                    let tasks = nightWatchTasks.weeklyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, index in
                        let nightWatchTaskWrapper = $nightWatchTasks
                        let taskBinding = nightWatchTaskWrapper.weeklyTasks
                        let theTaskBinding = taskBinding[index]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false){NavigationLink(destination: TaskDetailView(task: theTaskBinding), label:{ TaskRowView(task: task)})}
                    }).onDelete(perform: {
                        indexSet in nightWatchTasks.weeklyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: {indices, newOffset in nightWatchTasks.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)})
                }
                // MARK: Monthly Tasks
                Section(header:SectionHeaderView(imageSymbolName: "calendar", sectionHeaderName: "Monthly Tasks")
                ) {
                    let taskIndices = nightWatchTasks.monthlyTasks.indices
                    let tasks = nightWatchTasks.monthlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, index in
                        let nightWatchTaskWrapper = $nightWatchTasks
                        let taskBinding = nightWatchTaskWrapper.monthlyTasks
                        let theTaskBinding = taskBinding[index]
                        if focusModeOn == false || (focusModeOn && task.isComplete == false){NavigationLink(destination: TaskDetailView(task: theTaskBinding), label:{ TaskRowView(task: task)})}
                    }).onDelete(perform: {
                        indexSet in nightWatchTasks.monthlyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: {indices, newOffset in nightWatchTasks.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)})
                }
            }.navigationTitle("Home").toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reset"){
                        resetAlertShowing = true
                    }}
                ToolbarItem(placement: .bottomBar) {
                    Toggle(isOn: $focusModeOn, label:{Text("Focus Mode")}).toggleStyle(.switch)
                }
            }
            Spacer()
        }
        .alert(isPresented: $resetAlertShowing, content: {
            Alert(title: Text("Reset List"), message:Text("Are you sure?"), primaryButton: .cancel(), secondaryButton:.destructive(Text("Yes, Reset it!"), action: {
                let refreshedNightWatchTasks = NightWatchTasks()
                self.nightWatchTasks.nightlyTasks = refreshedNightWatchTasks.nightlyTasks
                self.nightWatchTasks.weeklyTasks = refreshedNightWatchTasks.weeklyTasks
                self.nightWatchTasks.monthlyTasks = refreshedNightWatchTasks.monthlyTasks
            }))
        })
    }
}

//MARK: ContentView Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let nightWatchTasks = NightWatchTasks()
        ContentView(nightWatchTasks: nightWatchTasks)
    }
}

//MARK: Other Structs
struct SectionHeaderView: View {
    let imageSymbolName:String
    let sectionHeaderName:String
    var body: some View {
        HStack {
            Text(Image(systemName: imageSymbolName)).foregroundColor(.blue).font(.title2).fontWeight(.heavy)
            Text(sectionHeaderName).font(.title2).underline().foregroundColor(.blue)
                .fontWeight(.heavy)
                .textCase(.uppercase)
        }
    }
}

struct TaskRowView: View {
    let task:Task
    var body: some View {
        if task.isComplete {
            HStack {
                Image(systemName: "checkmark.square")
                Text(task.name).foregroundColor(.gray).strikethrough()
            }
        } else {
            HStack {
                Image(systemName: "square")
                Text(task.name)
            }
        }
    }
}
