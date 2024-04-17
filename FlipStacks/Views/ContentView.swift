//
//  ContentView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 16.03.24.
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//    License, v. 2.0. If a copy of the MPL was not distributed with this
//    file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
