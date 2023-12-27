//
//  Task.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 19.12.23.
//

import Foundation

struct SingleTask: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var dificulty: Dificulty
    var creationDate: Date
    var description: String
    
    init(name: String, dificulty: Dificulty, creationDate: Date, description: String) {
        self.name = name
        self.dificulty = dificulty
        self.creationDate = creationDate
        self.description = description
    }
}
