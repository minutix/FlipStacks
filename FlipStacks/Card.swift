//
//  Item.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 16.03.24.
//

import Foundation
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

@Model
final class Card {
    var frontSide: String = ""
    var backSide: String = ""
    var phase: Int = 0
    var lastSeen: Date = Date()
    
    init(frontSide: String, backSide: String, lastSeen: Date) {
        self.frontSide = frontSide
        self.backSide = backSide
        self.lastSeen = lastSeen
    }
    init(frontSide: String, backSide: String) {
        self.frontSide = frontSide
        self.backSide = backSide
        self.lastSeen = Date()
    }
    
    func isValid() -> Bool {
        print("Checking card \"\(self.frontSide)\" – \"\(self.backSide)\" (phase \(self.phase), last seen \(self.lastSeen)")
        if self.phase < 0 {
            self.phase = 0
        }
        if self.phase > 6 {
            print("Skipped card (done)")
            return false
        }
        if Calendar.current.startOfDay(
            for: Calendar.current.date(
                byAdding: waitTimes[self.phase]!, to: self.lastSeen
            )!
        ) > Calendar.current.startOfDay(for: Date()) {
            print("Skipped card (not due)")
            return false
        }
        return true
    }
}
