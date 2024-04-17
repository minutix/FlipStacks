//
//  AddView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 17.03.24.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var frontSide = ""
    @State var backSide = ""
    fileprivate func addCard() {
        let newItem = Card(frontSide: frontSide, backSide: backSide)
        modelContext.insert(newItem)
        frontSide = ""
        backSide  = ""
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("FRONT_SIDE_FIELD", text: $frontSide)
                TextField("BACK_SIDE_FIELD", text: $backSide)
                Button {
                    addCard()
                } label: {
                    Label("ADD_ITEM", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    AddView()
}
