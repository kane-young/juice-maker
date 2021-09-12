//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

final class StockViewController: UIViewController {
    //MARK:-- @IBOutlet Properties
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    @IBOutlet private weak var strawberryStepper: StockStepper!
    @IBOutlet private weak var bananaStepper: StockStepper!
    @IBOutlet private weak var pineappleStepper: StockStepper!
    @IBOutlet private weak var kiwiStepper: StockStepper!
    @IBOutlet private weak var mangoStepper: StockStepper!
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
        rightBarButtonItem.title = "취소"
        rightBarButtonItem.action = #selector(touchUpClosedButton)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "재고 추가"
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func updateStock() {
        juiceMaker.updateStock(fruit: .strawberry, count: strawberryStepper.value)
        juiceMaker.updateStock(fruit: .banana, count: bananaStepper.value)
        juiceMaker.updateStock(fruit: .pineapple, count: pineappleStepper.value)
        juiceMaker.updateStock(fruit: .kiwi, count: kiwiStepper.value)
        juiceMaker.updateStock(fruit: .mango, count: mangoStepper.value)
    }
    
    private func configureStepper() {
        strawberryStepper.fruit = .strawberry
        bananaStepper.fruit = .banana
        pineappleStepper.fruit = .pineapple
        kiwiStepper.fruit = .kiwi
        mangoStepper.fruit = .mango
        strawberryStepper.value = juiceMaker.readStock(of: .strawberry)
        bananaStepper.value = juiceMaker.readStock(of: .banana)
        pineappleStepper.value = juiceMaker.readStock(of: .pineapple)
        kiwiStepper.value = juiceMaker.readStock(of: .kiwi)
        mangoStepper.value = juiceMaker.readStock(of: .mango)
    }
    
    private func configureFruitCountLabel() {
        strawberryCountLabel.text = juiceMaker.readStock(of: .strawberry)
        bananaCountLabel.text = juiceMaker.readStock(of: .banana)
        kiwiCountLabel.text = juiceMaker.readStock(of: .kiwi)
        pineappleCountLabel.text = juiceMaker.readStock(of: .pineapple)
        mangoCountLabel.text = juiceMaker.readStock(of: .mango)
    }
    
    @objc private func touchUpClosedButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:-- @IBAction Function
    @IBAction func touchStepper(_ sender: StockStepper) {
        guard let fruit = sender.fruit else { return }
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
}
