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
    @State var index: Int = 0
    @Query private var items: [Card]
    
    var body: some View {
        NavigationStack {
            VStack {
                CardLearningView(currentIndex: $index)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink("LIST_CARDS", destination: CardListView())
                }
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
}

#Preview {
    ContentView()
        .modelContainer(for: Card.self, inMemory: true)
}
