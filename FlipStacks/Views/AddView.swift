//
//  AddView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 17.03.24.
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//    License, v. 2.0. If a copy of the MPL was not distributed with this
//    file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
