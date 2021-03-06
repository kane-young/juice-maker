//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

final class StockViewController: UIViewController {
    static let identifier: String = "StockViewController"
    private enum Style {
        static let rightButtonTitle = "취소"
        static let navigationTitle = "재고 추가"
    }
    //MARK:-- @IBOutlet Properties
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    private let juiceMaker: JuiceMaker = JuiceMaker.shared
    
    //MARK:-- Life Cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        configureStepper()
        configureFruitCountLabel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        updateStock()
    }
    
    //MARK:-- initialize function
    private func configureNavigationController() {
        let rightBarButtonItem = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(touchUpClosedButton))
        rightBarButtonItem.title = Style.rightButtonTitle
        rightBarButtonItem.action = #selector(touchUpClosedButton)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = Style.navigationTitle
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func updateStock() {
        juiceMaker.updateStock(of: .strawberry, count: strawberryStepper.value)
        juiceMaker.updateStock(of: .banana, count: bananaStepper.value)
        juiceMaker.updateStock(of: .pineapple, count: pineappleStepper.value)
        juiceMaker.updateStock(of: .kiwi, count: kiwiStepper.value)
        juiceMaker.updateStock(of: .mango, count: mangoStepper.value)
    }
    
    private func configureStepper() {
        strawberryStepper.value = juiceMaker.count(of: .strawberry)
        bananaStepper.value = juiceMaker.count(of: .banana)
        pineappleStepper.value = juiceMaker.count(of: .pineapple)
        kiwiStepper.value = juiceMaker.count(of: .kiwi)
        mangoStepper.value = juiceMaker.count(of: .mango)
    }
    
    private func configureFruitCountLabel() {
        strawberryCountLabel.text = juiceMaker.count(of: .strawberry)
        bananaCountLabel.text = juiceMaker.count(of: .banana)
        kiwiCountLabel.text = juiceMaker.count(of: .kiwi)
        pineappleCountLabel.text = juiceMaker.count(of: .pineapple)
        mangoCountLabel.text = juiceMaker.count(of: .mango)
    }
    
    @objc private func touchUpClosedButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:-- @IBAction Function
    @IBAction func changedStepperValue(_ sender: UIStepper) {
        let fruit = classifyFruit(sender)
        let value = String(Int(sender.value))
        switch fruit {
        case .strawberry:
            strawberryCountLabel.text = value
        case .banana:
            bananaCountLabel.text = value
        case .pineapple:
            pineappleCountLabel.text = value
        case .kiwi:
            kiwiCountLabel.text = value
        case .mango:
            mangoCountLabel.text = value
        }
    }
    
    private func classifyFruit(_ stepper: UIStepper) -> Fruit {
        if stepper == strawberryStepper {
            return .strawberry
        } else if stepper == bananaStepper {
            return .banana
        } else if stepper == pineappleStepper {
            return .pineapple
        } else if stepper == kiwiStepper {
            return .kiwi
        } else {
            return .mango
        }
    }
}
