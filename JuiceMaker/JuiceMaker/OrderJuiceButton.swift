//
//  OrderJuiceButton.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/16.
//

import UIKit

class OrderJuiceButton: UIButton {
    var juice: Juice = .banana
    
    func make(menu: Juice) {
        do{
            try JuiceMaker.shared.makeJuice(using: menu)
        } catch {
            //수량이 부족합니다(alarm 을 만들어서 표시)
        }
    }
}
