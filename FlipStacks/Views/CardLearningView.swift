//
//  CardDetailView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 17.03.24.
//

import SwiftUI
import SwiftData

let waitTimes = [
    0: DateComponents(),
    1: DateComponents(day: 1),
    2: DateComponents(day: 3),
    3: DateComponents(day: 7),
    4: DateComponents(day: 14),
    5: DateComponents(month: 1),
    6: DateComponents(month: 3)
]

struct CardLearningView: View {
    @Query private var items: [Card]
    @State var showSolution = false
    @Binding var currentIndex: Int
    
    var body: some View {
        if items.indices.contains(currentIndex) {
            VStack {
                Text(items[currentIndex].frontSide)
                if showSolution == true {
                    Divider()
                    Text(items[currentIndex].backSide)
                    HStack {
                        Button {
                            if items[currentIndex].phase > 0 {
                                items[currentIndex].phase -= 1
                            }
                            showSolution = false
                            currentIndex += 1
                            findValidCard()
                        } label: {
                            Label("BUTTON.DIDNT_KNOW", systemImage: "xmark")
                        }
                        
                        Button {
                            items[currentIndex].phase += 1
                            showSolution = false
                            currentIndex += 1
                            findValidCard()
                        } label: {
                            Label("BUTTON.KNEW", systemImage: "checkmark")
                        }
                    }
                } else {
                    Button {
                        showSolution = true
                    } label: {
                        Text("BUTTON.SHOW_SOLUTION")
                    }
                }
            }
            .onAppear {
                findValidCard()
            }
        } else {
            NoCardsLeftView()
        }
    }
    
    private func findValidCard() {
        while !cardIsValid(items[currentIndex]) {
            currentIndex += 1
        }
        print("Found card \"\(items[currentIndex].frontSide)\" (Phase \(items[currentIndex].phase)).")
    }
    
    private func cardIsValid(_ card: Card) -> Bool {
        if items[items.firstIndex(of: card)!].phase < 0 {
            items[items.firstIndex(of: card)!].phase = 0
        }
        if card.phase > 6 {
            print("Skipped card \"\(card.frontSide)\" as it is in phase \(card.phase)")
            return false
        }
        if Calendar.current.date(
            byAdding: waitTimes[card.phase]!, to: card.lastSeen
        )! > Date() {
            print("Skipped card \"\(card.frontSide)\" (Phase \(card.phase)) as date \"\(card.lastSeen)\" has not passed for long enough")
            return false
        }
        return true
    }
}
