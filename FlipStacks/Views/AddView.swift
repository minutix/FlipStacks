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
            TextField("TEXT_FIELD.FRONT_SIDE", text: $frontSide)
            TextField("TEXT_FIELD.BACK_SIDE", text: $backSide)
                .onSubmit {
                    addCard()
                }
            Button {
                addCard()
            } label: {
                Label("BUTTON.ADD_ITEM", systemImage: "plus")
            }
        }
    }
}

#Preview {
    AddView()
}
