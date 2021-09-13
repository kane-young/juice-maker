//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class JuiceMaker {
    private var stock: FruitStock = FruitStock(initialCount: 10)
    static let shared = JuiceMaker()
    
    private init() { }
    
    func makeJuice(using juice: Juice) throws {
        let isSatisfied = juice.recipe.allSatisfy { (ingredient: Fruit, information: FruitInformation) in
            return stock.count(of: ingredient) >= information.count
        }
        if isSatisfied == false {
            throw JuiceMakerError.outOfStock
        }
        for (ingredient, information) in juice.recipe {
            stock.subtractStock(of: ingredient, count: information.count)
        }
    }
    
    func count(of fruit: Fruit) -> UInt {
        return stock.count(of: fruit)
    }
    
    func count(of fruit: Fruit) -> Double {
        return Double(stock.count(of: fruit))
    }
    
    func count(of fruit: Fruit) -> String {
        return String(stock.count(of: fruit))
    }

    func updateStock(fruit: Fruit, count: UInt) {
        stock.updateStock(of: fruit, count: count)
    }
    
    func updateStock(fruit: Fruit, count: Double) {
        stock.updateStock(of: fruit, count: UInt(count))
    }
}
