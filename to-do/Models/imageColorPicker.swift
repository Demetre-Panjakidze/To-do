//
//  labelCenterLogic.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 19.12.23.
//

import SwiftUI

func colorChanger(dificulty: Dificulty) -> Color {
    switch dificulty {
    case .easy:
        return Color.green
    case .medium:
        return Color.yellow
    case .hard:
        return Color.red
    }
}

func iconDisplayer(mode: Mode) -> Image {
    switch mode {
    case .toDo:
        return Image(systemName: "circle")
    case .inProgress:
        return Image(systemName: "ellipsis.circle")
    case .done:
        return Image(systemName: "checkmark.circle.fill")
    }
}

enum Dificulty: String, CaseIterable, Identifiable, Codable {
    case easy, medium, hard
    var id: Self { self }
}

enum Mode: String, CaseIterable, Identifiable, Codable {
    case toDo, inProgress, done
    var id: Self { self }
}

func modeStringReturner(mode: Mode) -> String {
    switch mode {
    case .toDo:
        return "To-do"
    case .inProgress:
        return  "In progress"
    case .done:
        return  "Done"
    }
}

func dificultyStringReturner(dificulty: Dificulty) -> String {
    switch dificulty {
    case .easy:
        return "Easy"
    case .medium:
        return "Medium"
    case .hard:
        return "Hard"
    }
}
