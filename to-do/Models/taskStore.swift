//
//  taskStore.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 26.12.23.
//

import SwiftUI
import Foundation

@MainActor
class TasksStore: ObservableObject {
    @Published var tasks: [Category] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appendingPathComponent("tasks.data")
    }
    
    func load() async throws {
        let task = Task<[Category], Error> {
            let fileURL = try Self.fileURL()
            print(fileURL)
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let tasks = try JSONDecoder().decode([Category].self, from: data)
            
            return tasks
        }
        let tasks = try await task.value
        self.tasks = tasks
    }
    
    func save(tasks: [Category]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(tasks)
            let outFile = try Self.fileURL()
            try data.write(to: outFile)
        }
        _ = try await task.value
    }
}
