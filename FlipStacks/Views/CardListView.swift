//
//  CardListView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 17.03.24.
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
                    Label("BUTTON.DELETE_ITEM", systemImage: "trash")
                }
            }
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
            }
        }
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    AddView()
                } label: {
                    Label("BUTTON.ADD_NEW_CARDS", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    CardListView()
        .modelContainer(for: Card.self, inMemory: false)
}
