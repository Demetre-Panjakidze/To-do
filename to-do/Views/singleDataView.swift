//
//  RandomFile.swift
//  to-do
//
//  Created by Omedia Mac Mini Flutter on 25.12.23.
//

import SwiftUI
import Foundation

struct SingleDataView: View {
    @Binding var arr: [Category]
    var mode: Mode
    
    var body: some View {
        ForEach($arr) { $arrItem in
                if arrItem.mode == mode {
                    NavigationLink(destination: DetailView(category: $arrItem, fullData: $arr)) {
                        HStack {
                            Text(arrItem.task.name)
                        }
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        print("Delete pressed")
                        let index = arr.firstIndex(of: arrItem)
                        arr.remove(at: index!)
                    } label: {
                        Text("Delete")
                    }
                }
            }
        }
    }
}
