//
//  OrderJuiceButton.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/17.
//

import UIKit
import Foundation

class OrderJuiceButton: UIButton {
    var juice: Juice = .strawberry
    
    func make(juice: Juice) -> UIAlertController {
        let alert = JuiceAlertController()
        do{
            try JuiceMaker.shared.makeJuice(using: juice)
            return alert.presentAlertOfSuccessmakeJuice(using: juice)
        } catch {
            return alert.presentAlertOfFail()
        }
    }
}
