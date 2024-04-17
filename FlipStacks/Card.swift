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
final class Card: Codable {
    enum CodingKeys: String, CodingKey {
        case frontSide
        case backSide
        case phase
        case lastSeen
    }
    
    var frontSide: String = ""
    var backSide: String = ""
    var phase: Int = 0
    var lastSeen: Date = Date()
    
    init(frontSide: String, backSide: String, lastSeen: Date) {
        self.frontSide = frontSide
        self.backSide = backSide
        self.lastSeen = lastSeen
    }
    convenience init(frontSide: String, backSide: String) {
        self.init(frontSide: frontSide, backSide: backSide, lastSeen: Date())
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        frontSide = try container.decode(String.self, forKey: .frontSide)
        backSide = try container.decode(String.self, forKey: .backSide)
        phase = try container.decode(Int.self, forKey: .phase)
        lastSeen = try container.decode(Date.self, forKey: .lastSeen)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: Card.CodingKeys.self)
        try container.encode(frontSide, forKey: .frontSide)
        try container.encode(backSide, forKey: .backSide)
        try container.encode(phase, forKey: .phase)
        try container.encode(lastSeen, forKey: .lastSeen)
    }
    
    func isValid() -> Bool {
        if self.phase < 0 {
            self.phase = 0
        }
        if self.phase > 6 {
            print("Skipped card \"\(self.frontSide)\" as it is in phase \(self.phase)")
            return false
        }
        if Calendar.current.startOfDay(
            for: Calendar.current.date(
                byAdding: waitTimes[self.phase]!, to: self.lastSeen
            )!
        ) > Calendar.current.startOfDay(for: Date()) {
            print("Skipped card \"\(self.frontSide)\" (Phase \(self.phase)) as date \"\(self.lastSeen)\" has not passed for long enough")
            return false
        }
        return true
    }
}
