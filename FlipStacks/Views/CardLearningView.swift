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
                            items[currentIndex].phase -= 1
                            currentIndex += 1
                        } label: {
                            Label("BUTTON.DIDNT_KNOW", systemImage: "xmark")
                        }
                        
                        Button {
                            items[currentIndex].phase += 1
                            currentIndex += 1
                        } label: {
                            Label("BUTTON.KNEW", systemImage: "checkmark")
                        }
                    }
                } else {
                    Button {
                        showSolution = true
                        print(showSolution)
                    } label: {
                        Text("BUTTON.SHOW_SOLUTION")
                    }
                }
            }
            .onAppear {
                if items[currentIndex].phase > 6 {
                    print("Skipped card \(items[currentIndex].frontSide) as it is in phase \(items[currentIndex].phase)")
                    currentIndex += 1
                    return
                }
                if Calendar.current.date(
                    byAdding: waitTimes[items[currentIndex].phase]!, to: items[currentIndex].lastSeen
                )! > Date() {
                    print("Skipped card \(items[currentIndex].frontSide) as date \"\(items[currentIndex].lastSeen)\" has not passed for long enough")
                    currentIndex += 1
                    return
                }
            }
        } else {
            NoCardsLeftView()
        }
    }
}
