//
//  OrderUIButton.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/19.
//

import UIKit

class OrderUIButton: UIButton {
    var juice: Juice?
    
    func orderButton(juice: Juice) -> UIAlertController {
        do {
            try JuiceMaker.shared.makeJuice(using: juice)
            let alert = JuiceIsMadeAlertController().juiceIsMade(using: juice)
            return alert
        } catch {
            let outOfStock = OutOfStockUIAlertController().outOfStock()
            return outOfStock
        }
    }
}
