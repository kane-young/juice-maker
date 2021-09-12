//
//  Juice.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/09/04.
//

import Foundation

typealias FruitCount = [Fruit: FruitInformation]

enum Juice: CustomStringConvertible {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangokiwi
    
    var description: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .strawberryBanana:
            return "딸바"
        case .mango:
            return "망고"
        case .mangokiwi:
            return "망키"
        }
    }
    
    var recipe: FruitCount {
        switch self {
        case .strawberry:
            return [.strawberry: FruitInformation(count: 16)]
        case .banana:
            return [.banana: FruitInformation(count: 2)]
        case .kiwi:
            return [.kiwi: FruitInformation(count: 3)]
        case .pineapple:
            return [.pineapple: FruitInformation(count: 2)]
        case .strawberryBanana:
            return [.strawberry: FruitInformation(count: 10), .banana: FruitInformation(count: 1)]
        case .mango:
            return [.mango: FruitInformation(count: 3)]
        case .mangokiwi:
            return [.mango: FruitInformation(count: 2), .kiwi: FruitInformation(count: 1)]
        }
    }
}
