//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var orderStrawberryJuiceButton: OrderUIButton!
    @IBOutlet var orderBananaJuiceButton: OrderUIButton!
    @IBOutlet var orderPineappleJuiceButton: OrderUIButton!
    @IBOutlet var orderKiwiJuiceButton: OrderUIButton!
    @IBOutlet var orderMangoJuiceButton: OrderUIButton!
    @IBOutlet var orderStrawberryBananaJuiceButton: OrderUIButton!
    @IBOutlet var orderMangoKiwiJuiceButton: OrderUIButton!
    
    @IBOutlet var strawberryCount: UILabel!
    @IBOutlet var bananaCount: UILabel!
    @IBOutlet var pineappleCount: UILabel!
    @IBOutlet var kiwiCount: UILabel!
    @IBOutlet var mangoCount: UILabel!
    @IBOutlet var addStock: UIBarButtonItem!
    
    var juiceMaker: JuiceMaker = JuiceMaker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func inStockFruit(of fruit: Fruit) -> String {
        return String(juiceMaker.readStock(of: fruit))
        
    }
    
    @IBAction func orderFruitJuice(_ sender: OrderUIButton) {
        guard let orderMenu = sender.juice else {
            return
        }
        let alert = sender.orderButton(juice: orderMenu)
        updateLabel()
        self.present(alert, animated: false, completion: nil)
    }
        
    func initializeButton() {
        self.orderKiwiJuiceButton.juice = .kiwi
        self.orderMangoJuiceButton.juice = .mango
        self.orderBananaJuiceButton.juice = .banana
        self.orderPineappleJuiceButton.juice = .pineapple
        self.orderStrawberryJuiceButton.juice = .strawberry
        self.orderMangoKiwiJuiceButton.juice = .mangokiwi
        self.orderStrawberryBananaJuiceButton.juice = .strawberryBanana
    }
    
    func updateLabel() {
        strawberryCount.text = String(juiceMaker.readStock(of: .strawberry))
        mangoCount.text = String(juiceMaker.readStock(of: .mango))
        kiwiCount.text = String(juiceMaker.readStock(of: .kiwi))
        pineappleCount.text = String(juiceMaker.readStock(of: .pineapple))
        bananaCount.text = String(juiceMaker.readStock(of: .banana))
    }
        
}
