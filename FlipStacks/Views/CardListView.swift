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
    @Query var items: [Card]
    
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
        }
    }
}

#Preview {
    CardListView()
        .modelContainer(for: Card.self, inMemory: false)
}
