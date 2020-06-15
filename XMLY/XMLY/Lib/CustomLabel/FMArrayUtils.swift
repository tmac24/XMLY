//
//  FMArrayUtils.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/15.
//  Copyright © 2020 happy. All rights reserved.
//

import Foundation

public extension Array {
    
    /**
     Returns a random element from the array. Can be used to create a playful
     message that cycles randomly through a set of emoji icons, for example.
     */
    func sm_random() -> Iterator.Element? {
        guard count > 0 else { return nil }
        return self[Int(arc4random_uniform(UInt32(count)))]
    }
}
