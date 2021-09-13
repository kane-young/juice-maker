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
    @IBOutlet private weak var orderStrawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var orderStrawberryJuiceButton: UIButton!
    @IBOutlet private weak var orderBananaJuiceButton: UIButton!
    @IBOutlet private weak var orderPineappleJuiceButton: UIButton!
    @IBOutlet private weak var orderMangoKiwiJuiceButton: UIButton!
    @IBOutlet private weak var orderKiwiJuiceButton: UIButton!
    @IBOutlet private weak var orderMangoJuiceButton: UIButton!
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
        guard let stockViewController = self.storyboard?.instantiateViewController(identifier: StockViewController.identifier) else {
            return
        }
      self.navigationController?.pushViewController(stockViewController, animated: true)
    }

    @IBAction private func orderJuice(_ sender: UIButton) {
        let juice = classifyButton(sender)
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
    
    private func classifyButton(_ button: UIButton) -> Juice {
        switch button {
        case orderStrawberryJuiceButton:
            return .strawberry
        case orderStrawberryBananaJuiceButton:
            return .strawberryBanana
        case orderBananaJuiceButton:
            return .banana
        case orderPineappleJuiceButton:
            return .pineapple
        case orderKiwiJuiceButton:
            return .kiwi
        case orderMangoKiwiJuiceButton:
            return .mangokiwi
        default:
            return .mango
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
            strawberryCountLabel.text = juiceMaker.count(of: .strawberry)
        case .banana:
            bananaCountLabel.text = juiceMaker.count(of: .banana)
        case .pineapple:
            pineappleCountLabel.text = juiceMaker.count(of: .pineapple)
        case .kiwi:
            kiwiCountLabel.text = juiceMaker.count(of: .kiwi)
        case .mango:
            mangoCountLabel.text = juiceMaker.count(of: .mango)
        }
    }

    private func updateFruitCount() {
        strawberryCountLabel.text = juiceMaker.count(of: .strawberry)
        bananaCountLabel.text = juiceMaker.count(of: .banana)
        kiwiCountLabel.text = juiceMaker.count(of: .kiwi)
        pineappleCountLabel.text = juiceMaker.count(of: .pineapple)
        mangoCountLabel.text = juiceMaker.count(of: .mango)
    }
}
