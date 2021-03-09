//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice {
    case strawberry, banana, kiwi, pineapple, strawberryBanana, mango, mangokiwi

    var recipe: [Fruit: UInt] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi:3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangokiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

enum JuiceMakerErorr: Error {
    case outOfStock
}

struct Stock {
    var fruits: [Fruit: UInt]
    
    init(initialAmount: UInt) {
        fruits = [.strawberry: initialAmount, .banana: initialAmount, .kiwi: initialAmount, .pineapple: initialAmount, .mango: initialAmount]
    }
    
    mutating func addStock(of fruit: Fruit) {
        if let storedFruit = fruits[fruit] {
            fruits[fruit] = storedFruit + 1
        }
    }
    
    mutating func subtractStock(of fruit: Fruit) {
        if let storedFruit = fruits[fruit] {
            fruits[fruit] = storedFruit - 1
        }
    }
}

class JuiceMaker {
    var stock: Stock = Stock(initialAmount: 10)
    
    func makeJuice(using juice: Juice) {
        for (ingredient, amount) in juice.recipe {
            guard let storedFruit = stock.fruits[ingredient] else {
                return
            }
            
            if storedFruit > amount {
                stock.fruits[ingredient] = storedFruit - amount
            } else {
                // 부족할 경우
            }
        }
    }
}
