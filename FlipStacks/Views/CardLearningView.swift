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
    @State var showNoCardsLeftView = false
    
    var body: some View {
        if items.hasIndex(currentIndex) || !showNoCardsLeftView {
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
                            increaseIndex()
                            findValidCard()
                        } label: {
                            Label("BUTTON.DIDNT_KNOW", systemImage: "xmark")
                        }
                        
                        Button {
                            items[currentIndex].phase += 1
                            showSolution = false
                            increaseIndex()
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
                .onAppear {
                    showNoCardsLeftView = true
                }
        }
    }
    
    private func increaseIndex() {
        if items.hasIndex(currentIndex + 1) {
            currentIndex += 1
        } else {
            showNoCardsLeftView = true
        }
    }
    
    private func findValidCard() {
        while !cardIsValid(items[currentIndex]) {
            increaseIndex()
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
