//
//  DetailView.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 19.12.23.
//

import SwiftUI

struct DetailView: View {
    @Binding var category: Category
    @Binding var fullData: [Category]
    @State private var editingCategory = Category.EmptyCategory
    
    @State private var editSheetActive: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            List {
                Section("Task information") {
                    HStack {
                        Label(
                            title: { Text(modeStringReturner(mode: category.mode)) },
                            icon: { iconDisplayer(mode: category.mode) }
                        )
                    }
                    HStack {
                        Label(title: {
                            Text(dificultyStringReturner(dificulty: category.task.dificulty))
                        }, icon: {
                            Image(systemName: "circle.fill")
                                .foregroundStyle(colorChanger(dificulty: category.task.dificulty))
                        })
                    }
                }
                Section("Created at") {
                    Label("\(category.task.creationDate, style: .date)", systemImage: "calendar")
                }
                Section("Description") {
                    Label(category.task.description, systemImage: "info.circle")
                }
                Section("Removing") {
                    Button(role: .destructive, action: {
                        let index = fullData.firstIndex(of: category)
                        fullData.remove(at: index!)
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Delete")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                }
            }
            .toolbar {
                Button("Edit") {
                    editSheetActive.toggle()
                    editingCategory = category
                }
            }
            .navigationTitle(category.task.name)
            .sheet(isPresented: $editSheetActive, content: {
                NavigationStack {
                    DetailEditView(category: $editingCategory, sheetActive: $editSheetActive)
                        .navigationTitle("\(category.task.name) edit")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    print("Cancel clicked")
                                    editSheetActive.toggle()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    category = editingCategory
                                    presentationMode.wrappedValue.dismiss()
                                    
                                }
                            }
                        }
                }
            })
        }
    }
}

#Preview {
    DetailView(category: .constant(Category.PreviewCategory), fullData: .constant([Category.PreviewCategory]))
}
