//
//  ContentView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 16.03.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Card]
    @State var showSolution = true
    @State var index = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                if items.indices.contains(index) {
                    CardDetailView(item: items[index], showSolution: showSolution)
                } else {
                    VStack {
                        Text("ALL_CARDS_REVIEWED")
                        NavigationLink {
                            
                        } label: {
                            Text("BUTTON.ADD_NEW_CARDS")
                        }
                    }
                }
            }
        }
        .padding()
    }

    private func addItem() {
        withAnimation {
            let newItem = Card(frontSide: "Hello!", backSide: "¡Hola!")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Card.self, inMemory: true)
}
