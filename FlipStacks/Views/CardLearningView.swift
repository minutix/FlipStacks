//
//  CardDetailView.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 17.03.24.
//

import SwiftUI
import SwiftData

struct CardLearningView: View {
    @Query private var items: [Card]
    @State var showSolution = false
    @Binding var currentIndex: Int
    
    var body: some View {
        if items.hasIndex(currentIndex) && items[currentIndex].isValid() {
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
                            items[currentIndex].lastSeen = Date()
                            print("Set \"\(items[currentIndex].frontSide)\" to phase \(items[currentIndex].phase)")
                            showSolution = false
                            increaseIndex()
                            findValidCard()
                        } label: {
                            Label("DIDNT_KNOW", systemImage: "xmark")
                        }
                        
                        Button {
                            items[currentIndex].phase += 1
                            items[currentIndex].lastSeen = Date()
                            print("Set \"\(items[currentIndex].frontSide)\" to phase \(items[currentIndex].phase)")
                            showSolution = false
                            increaseIndex()
                            findValidCard()
                        } label: {
                            Label("KNEW", systemImage: "checkmark")
                        }
                    }
                } else {
                    Button {
                        showSolution = true
                    } label: {
                        Text("SHOW_SOLUTION")
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
    
    private func increaseIndex() {
        if items.hasIndex(currentIndex + 1) {
            currentIndex += 1
        }
    }
    
    private func findValidCard() {
        while !items[currentIndex].isValid() {
            increaseIndex()
        }
        print("Found card \"\(items[currentIndex].frontSide)\" (Phase \(items[currentIndex].phase)).")
    }
}
