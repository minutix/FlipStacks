//
//  Item.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 16.03.24.
//

import Foundation
import SwiftData

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
}
