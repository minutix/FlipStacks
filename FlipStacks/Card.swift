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
    
    init(frontSide: String, backSide: String) {
        self.frontSide = frontSide
        self.backSide = backSide
    }
}
