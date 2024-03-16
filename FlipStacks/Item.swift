//
//  Item.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 16.03.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
