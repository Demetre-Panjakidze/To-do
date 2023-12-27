//
//  TaskViews.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 19.12.23.
//

import SwiftUI

struct TasksView: View {
    @Binding var data: [Category]
    @Environment(\.scenePhase) private var scenePhase
    @State var emptyData: Category = Category.EmptyCategory
    @State var createSheetActive: Bool = false
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack {
            List {
                Section("To-Do") {
                    if data.filter({ $0.mode == .toDo }).isEmpty {
                        HStack {
                            Spacer()
                            Text("No To-do tasks")
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                    } else {
                        SingleDataView(arr: $data, mode: .toDo)
                    }
                }
                Section("In progress") {
                    if data.filter({ $0.mode == .inProgress }).isEmpty {
                        HStack {
                            Spacer()
                            Text("No In progress tasks")
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                    } else {
                        SingleDataView(arr: $data, mode: .inProgress)
                    }
                }
                Section("Done") {
                    if data.filter({ $0.mode == .done }).isEmpty {
                        HStack {
                            Spacer()
                            Text("No Done tasks")
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                    } else {
                        SingleDataView(arr: $data, mode: .done)
                    }
                }
            }
            .toolbar {
                Button(action: {
                    createSheetActive.toggle()
                }) {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("Tasks")
            .sheet(isPresented: $createSheetActive) {
                NavigationStack {
                    TaskCrationView(category: $emptyData, sheetActive: $createSheetActive)
                        .navigationTitle("Task creation")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    createSheetActive.toggle()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    data.append(emptyData)
                                    emptyData = Category.EmptyCategory
                                    createSheetActive.toggle()
                                }
                            }
                        }
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }
}

#Preview {
    TasksView(data: .constant(Category.sampleData), saveAction: {})
}
