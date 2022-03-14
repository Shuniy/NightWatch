//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Shubham Kumar on 15/01/22.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @State private var nightWatchTasks = NightWatchTasks()
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: nightWatchTasks)
        }
    }
}
