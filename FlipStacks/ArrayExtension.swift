//
//  ArrayHasIndex.swift.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 15.04.24.
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//    License, v. 2.0. If a copy of the MPL was not distributed with this
//    file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

import Foundation

extension Array {
    func hasIndex(_ i: Index) -> Bool{
        return self.indices.contains(i)
    }
}
