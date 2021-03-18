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
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        initializeButtonJuice()
        updateLabelText()
    }
    
    @IBAction func orderJuice(_ sender: OrderJuiceButton) {
        let alert = sender.make(juice: sender.juice)
        self.present(alert, animated: false, completion: nil)
        updateLabelText()
    }
    
    private func initializeButtonJuice() {
        orderStrawberryJuiceButton.juice = Juice.strawberry
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

