//
//  TodoListApp.swift
//  TodoList
//
//  Created by asset 212 on 19/11/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
