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

    var recipe: [Fruit: Int] {
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

class JuiceMaker {
    private(set) var stock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .kiwi: 10, .pineapple: 10, .mango: 10]
    
    func makeJuice(using juice: Juice) {
        for (ingredient, amount) in juice.recipe {
            guard let storedFruit = stock[ingredient] else {
                return
            }
            
            if storedFruit > amount {
                stock[ingredient] = storedFruit - amount
            } else {
                // 부족할 경우
            }
        }
    }
    
    func addStock(of fruit: Fruit) {
        if let storedFruit = stock[fruit] {
            stock[fruit] = storedFruit + 1
        }
    }
}

let kane: JuiceMaker = JuiceMaker()
kane.makeJuice(using: .banana)
print(kane.stock)
kane.addStock(of: .banana)
print(kane.stock)
