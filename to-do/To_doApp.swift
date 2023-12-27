//
//  to_doApp.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 19.12.23.
//

import SwiftUI

@main
struct to_doApp: App {
    @StateObject private var store = TasksStore()
    
    var body: some Scene {
        WindowGroup {
            TasksView(data: $store.tasks) {
                Task {
                    do {
                        try await store.save(tasks: store.tasks)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
