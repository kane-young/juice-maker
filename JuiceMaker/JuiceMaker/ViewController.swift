//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var orderStrawberryJuiceButton: OrderJuiceButton!
    @IBOutlet var orderBananaJuiceButton: OrderJuiceButton!
    @IBOutlet var orderPineappleJuiceButton: OrderJuiceButton!
    @IBOutlet var orderKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet var orderMangoJuiceButton: OrderJuiceButton!
    @IBOutlet var orderStrawberryBananaJuiceButton: OrderJuiceButton!
    @IBOutlet var orderMangoKiwiJuiceButton: OrderJuiceButton!
    
    @IBOutlet var strawberryCount: UILabel!
    @IBOutlet var bananaCount: UILabel!
    @IBOutlet var pineappleCount: UILabel!
    @IBOutlet var kiwiCount: UILabel!
    @IBOutlet var mangoCount: UILabel!
    
    var juiceMaker: JuiceMaker = JuiceMaker.shared
    
    override func viewDidLoad() {
        initializeButtonJuice()
        super.viewDidLoad()
        
        
    }
    
    @objc func didRecive(_ noti: Notification) {
        guard let fruits: FruitCount = noti.userInfo?["fruit"] as? FruitCount else { return }
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        updateLabelText()
    }
    
    @IBAction func orderJuice(_ sender: OrderJuiceButton) {
        guard let juice = sender.juice else {
            return
        }
        let alert = sender.make(juice: juice)
        self.present(alert, animated: false, completion: nil)
        updateLabelText()
    }
    
    @IBAction func moveStock(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "StockVC") else {
            return
        }
        self.present(uvc, animated: false, completion: nil)
    }
    
    private func initializeButtonJuice() {
        orderStrawberryJuiceButton.juice = .strawberry
        orderBananaJuiceButton.juice = .banana
        orderPineappleJuiceButton.juice = .pineapple
        orderKiwiJuiceButton.juice = .kiwi
        orderMangoJuiceButton.juice = .mango
        orderStrawberryBananaJuiceButton.juice = .strawberryBanana
        orderMangoKiwiJuiceButton.juice = .mangokiwi
    }
    
    private func updateLabelText() {
        strawberryCount.text = String(juiceMaker.readStock(of: .strawberry))
        bananaCount.text = String(juiceMaker.readStock(of: .banana))
        pineappleCount.text = String(juiceMaker.readStock(of: .pineapple))
        kiwiCount.text = String(juiceMaker.readStock(of: .kiwi))
        mangoCount.text = String(juiceMaker.readStock(of: .mango))
    }
}


extension Notification.Name {
    static let stock = Notification.Name("changeStock")
}
