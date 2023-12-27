//
//  Category.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 19.12.23.
//

import Foundation

struct Category: Identifiable, Equatable, Codable {
    var id = UUID()
    var mode: Mode
    var task: SingleTask
    
    init(mode: Mode, task: SingleTask) {
        self.mode = mode
        self.task = task
    }
}


extension Category {
    static var sampleData: [Category] =
    [
        Category(mode: .toDo, task: SingleTask(name: "task 1", dificulty: .easy, creationDate: Date.now, description: "This is task 1")),
        Category(mode: .toDo, task: SingleTask(name: "task 2", dificulty: Dificulty.easy, creationDate: Date.now, description: "This is task 2")),
        Category(mode: .inProgress, task: SingleTask(name: "task 3", dificulty: .medium, creationDate: Date.now, description: "This is task 3")),
        Category(mode: .done, task: SingleTask(name: "task 4", dificulty: .hard, creationDate: Date.now, description: "This is task 4")),
        Category(mode: .done, task: SingleTask(name: "task 5", dificulty: Dificulty.easy, creationDate: Date.now, description: "This is task 5")),
        Category(mode: .done, task: SingleTask(name: "task 6", dificulty: .hard, creationDate: Date.now, description: "This is task 6"))
    ]
}

extension Category {
    static var EmptyCategory: Category {
        Category(mode: .toDo, task: SingleTask(name: "", dificulty: Dificulty.easy, creationDate: Date.now, description: ""))
    }
}

extension Category {
    static var PreviewCategory: Category {
        Category(
            mode: .done,
            task: SingleTask(name: "previewTask",
                       dificulty: Dificulty.hard,
                       creationDate: Date.now,
                       description: "This is a preview taskhis is a preview taskhis is a preview taskThis is a preview taskhis is a preview taskhis is a preview taskThis is a preview taskhis is a preview taskhis is a preview taskThis is a preview taskhis is a preview taskhis is a preview task")
        )
    }
}
