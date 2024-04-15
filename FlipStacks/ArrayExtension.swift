//
//  ArrayHasIndex.swift.swift
//  FlipStacks
//
//  Created by Linus Warnatz on 15.04.24.
//

import Foundation

extension Array {
    func hasIndex(_ index: Index) -> Bool{
        return self.indices.contains(index)
    }
}
