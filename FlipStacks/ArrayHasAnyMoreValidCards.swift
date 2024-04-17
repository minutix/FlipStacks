//
//  ArrayHasAnyMoreValidCards.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 16.04.24.
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//    License, v. 2.0. If a copy of the MPL was not distributed with this
//    file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
