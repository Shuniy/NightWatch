//
//  Task.swift
//  NightWatch
//
//  Created by Shubham Kumar on 17/01/22.
//

import Foundation

struct Task:Identifiable {
    let id = UUID()
    let name:String
    var isComplete:Bool
    let lastCompleted:Date?
}
