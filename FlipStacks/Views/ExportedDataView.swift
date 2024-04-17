//
//  ExportedDataView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 17.04.24.
//

import SwiftUI

struct ExportedDataView: View {
    var data: [Card]
    
    var body: some View {
        TextEditor(
            text: .constant(
                String(
                    data: try! JSONEncoder().encode(data), encoding: .utf8
                ) ?? "An error occurred exporting your data."
            )
        )
    }
}

#Preview {
    ExportedDataView(data: [Card(frontSide: "Hello!", backSide: "Bonjour!"), Card(frontSide: "I don't know.", backSide: "Je ne cest pas.")])
}
