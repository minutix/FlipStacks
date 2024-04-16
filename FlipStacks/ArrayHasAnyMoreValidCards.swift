//
//  ArrayHasAnyMoreValidCards.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 16.04.24.
//

import Foundation

extension Array<Card> {
    func hasMoreValidCards(starting minIndex: Index) -> Bool {
        guard self.isEmpty else {
            return false
        }
        for i in minIndex..<self.endIndex {
            if !self[i].isValid() {
                return false
            }
        }
        return true
    }
}
