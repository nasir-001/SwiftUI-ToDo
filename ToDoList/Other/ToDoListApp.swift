//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Nasir on 05/01/2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
