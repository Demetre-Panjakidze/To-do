//
//  TaskCrationView.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 26.12.23.
//

import SwiftUI

struct TaskCrationView: View {
    @Binding var category: Category
    @Binding var sheetActive: Bool
    
    var body: some View {
        List {
            Section("Task name") {
                HStack {
                    Image(systemName: "textformat.size").foregroundStyle(.blue)
                    TextField("Task Name", text: $category.task.name)
                        .autocorrectionDisabled(true)
                }
            }
            Section("Task difficuly") {
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(colorChanger(dificulty: category.task.dificulty))
                    Picker("Task dificulty", selection: $category.task.dificulty) {
                        ForEach(Dificulty.allCases) { dificulty in
                            Text(dificulty.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
            }
            Section("Task Description") {
                HStack {
                    Image(systemName: "info.circle").foregroundStyle(.blue)
                    TextField("Task description", text: $category.task.description, axis: .vertical)
                        .autocorrectionDisabled(true)
                }
            }
            Section("Task Modes") {
                HStack {
                    iconDisplayer(mode: category.mode)
                        .foregroundStyle(.blue)
                    Picker("Task Modes", selection: $category.mode) {
                        ForEach(Mode.allCases) { mode in
                            Text(modeStringReturner(mode: mode))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TaskCrationView(
        category: .constant(Category.PreviewCategory),
        sheetActive: .constant(true)
    )
}


