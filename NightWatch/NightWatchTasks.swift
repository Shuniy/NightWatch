//
//  NightWatchTasks.swift
//  NightWatch
//
//  Created by Shubham Kumar on 18/01/22.
//

import Foundation
import SwiftUI

class NightWatchTasks:ObservableObject {
    @Published var nightlyTasks = [
        Task(name:"Check PluralSight Lessons", isComplete: false, lastCompleted: nil),
        Task(name:"Work On the iOS Project", isComplete: false, lastCompleted: nil),
        Task(name:"Work on User Stories", isComplete: false, lastCompleted: nil),
        Task(name:"Buy Groceries", isComplete: false, lastCompleted: nil),
        Task(name:"Drink Water", isComplete: false, lastCompleted: nil),
        Task(name:"Check SwiftUI Fundamentals", isComplete: false, lastCompleted: nil),
        Task(name:"Check Teams and Outlook Messages", isComplete: false, lastCompleted: nil),
    ]
    
    @Published var weeklyTasks = [
        Task(name:"Complete the current project", isComplete: false, lastCompleted: nil),
        Task(name:"Complete the design Process", isComplete: false, lastCompleted: nil),
        Task(name:"Learn Agile and system design!", isComplete: false, lastCompleted: nil)
    ]
    
    @Published var monthlyTasks = [
        Task(name:"Compelete iOS Training", isComplete: false, lastCompleted: nil),
        Task(name:"Finish iOS Projects", isComplete: false, lastCompleted: nil)
    ]
}
