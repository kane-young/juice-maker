//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/09/04.
//

import Foundation

struct FruitStock {
    private var remainedFruit: FruitInfos

    init(initialCount: UInt) {
        remainedFruit = [.strawberry: FruitInformation(count: initialCount),
                         .banana: FruitInformation(count: initialCount),
                         .kiwi: FruitInformation(count: initialCount),
                         .pineapple: FruitInformation(count: initialCount),
                         .mango: FruitInformation(count: initialCount)]
    }

    mutating func addStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = storedFruit.count + count
        }
    }

    mutating func subtractStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = storedFruit.count - count
        }
    }
    
    mutating func updateStock(of fruit: Fruit, count: UInt) {
        remainedFruit[fruit]?.count = count
    }

    func count(of fruit: Fruit) -> UInt {
        if let storedFruit = remainedFruit[fruit] {
            return storedFruit.count
        } else {
            return 0
        }
    }
}
