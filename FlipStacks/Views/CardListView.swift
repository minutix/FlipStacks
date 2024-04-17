//
//  CardListView.swift
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

struct CardListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Card.frontSide) var items: [Card]
    
    var body: some View {
        List(items) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.frontSide)
                    Text(item.backSide)
                }
                Spacer()
                Text(item.phase.description)
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button(role: .destructive) {
                    modelContext.delete(item)
                } label: {
                    Label("DELETE_ITEM", systemImage: "trash")
                }
            }/*
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                Button {
                    modelContext.delete(item)
                } label: {
                    NavigationLink {
                        AddView(frontSide: item.frontSide, backSide: item.backSide)
                    } label: {
                        Label("BUTTON.EDIT_ITEM", systemImage: "pencil")
                    }
                }
            }*/
        }
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    AddView()
                } label: {
                    Label("ADD_NEW_CARDS", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    CardListView()
        .modelContainer(for: Card.self, inMemory: false)
}
