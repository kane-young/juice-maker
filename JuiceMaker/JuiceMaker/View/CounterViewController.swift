//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class CounterViewController: UIViewController {
    //MARK:-- @IBOutlet Properties
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    @IBOutlet private weak var orderStrawberryBananaJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderStrawberryJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderBananaJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderPineappleJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderMangoKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderMangoJuiceButton: OrderJuiceButton!
    private let juiceMaker: JuiceMaker = JuiceMaker.shared

    //MARK:-- Life Cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        configureButtonsAccessibility()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitCount()
    }

    //MARK:-- @IBAction Function
    @IBAction private func moveStock(_ sender: Any) {
        guard let stockVC = self.storyboard?.instantiateViewController(identifier: "stockVC") else {
            return
        }
      self.navigationController?.pushViewController(stockVC, animated: true)
    }

    @IBAction private func orderJuice(_ sender: OrderJuiceButton) {
        guard let juice = sender.juice else { return }
        do {
            try juiceMaker.makeJuice(using: juice)
            alertOfSuccess(juice: juice)
        } catch {
            alertOfFail()
        }
        for (fruit, _) in juice.recipe {
            updateFruitCountLabel(fruit)
        }
    }

    //MARK:-- initialize function
    private func configureButtonsAccessibility() {
        orderStrawberryJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderStrawberryBananaJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderBananaJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderPineappleJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderKiwiJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderMangoJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderMangoKiwiJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    private func configureButtons() {
        orderStrawberryJuiceButton.juice = .strawberry
        orderBananaJuiceButton.juice = .banana
        orderStrawberryBananaJuiceButton.juice = .strawberryBanana
        orderKiwiJuiceButton.juice = .kiwi
        orderMangoJuiceButton.juice = .mango
        orderMangoKiwiJuiceButton.juice = .mangokiwi
        orderPineappleJuiceButton.juice = .pineapple
        orderStrawberryJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderBananaJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderStrawberryBananaJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderKiwiJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderMangoJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderMangoKiwiJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderPineappleJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    private func updateFruitCountLabel(_ fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberryCountLabel.text = juiceMaker.readStock(of: .strawberry)
        case .banana:
            bananaCountLabel.text = juiceMaker.readStock(of: .banana)
        case .pineapple:
            pineappleCountLabel.text = juiceMaker.readStock(of: .pineapple)
        case .kiwi:
            kiwiCountLabel.text = juiceMaker.readStock(of: .kiwi)
        case .mango:
            mangoCountLabel.text = juiceMaker.readStock(of: .mango)
        }
    }

    private func updateFruitCount() {
        strawberryCountLabel.text = juiceMaker.readStock(of: .strawberry)
        bananaCountLabel.text = juiceMaker.readStock(of: .banana)
        kiwiCountLabel.text = juiceMaker.readStock(of: .kiwi)
        pineappleCountLabel.text = juiceMaker.readStock(of: .pineapple)
        mangoCountLabel.text = juiceMaker.readStock(of: .mango)
    }
}
