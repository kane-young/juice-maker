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
        juiceMaker.updateStock(fruit: .strawberry, count: UInt(strawberryStepper.value))
        juiceMaker.updateStock(fruit: .banana, count: UInt(bananaStepper.value))
        juiceMaker.updateStock(fruit: .pineapple, count: UInt(pineappleStepper.value))
        juiceMaker.updateStock(fruit: .kiwi, count: UInt(kiwiStepper.value))
        juiceMaker.updateStock(fruit: .mango, count: UInt(mangoStepper.value))
    }
    
    private func configureStepper() {
        strawberryStepper.fruit = .strawberry
        bananaStepper.fruit = .banana
        pineappleStepper.fruit = .pineapple
        kiwiStepper.fruit = .kiwi
        mangoStepper.fruit = .mango
        strawberryStepper.value = Double(juiceMaker.readStock(of: .strawberry))
        bananaStepper.value = Double(juiceMaker.readStock(of: .banana))
        pineappleStepper.value = Double(juiceMaker.readStock(of: .pineapple))
        kiwiStepper.value = Double(juiceMaker.readStock(of: .kiwi))
        mangoStepper.value = Double(juiceMaker.readStock(of: .mango))
    }
    
    private func configureFruitCountLabel() {
        strawberryCountLabel.text = String(JuiceMaker.shared.readStock(of: .strawberry))
        bananaCountLabel.text = String(JuiceMaker.shared
                                        .readStock(of: .banana))
        kiwiCountLabel.text = String(JuiceMaker.shared.readStock(of: .kiwi))
        pineappleCountLabel.text = String(JuiceMaker.shared.readStock(of: .pineapple))
        mangoCountLabel.text = String(JuiceMaker.shared.readStock(of: .mango))
    }
    
    @objc private func touchUpClosedButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:-- @IBAction Function
    @IBAction func touchStepper(_ sender: StockStepper) {
        guard let fruit = sender.fruit else { return }
        switch fruit {
        case .strawberry:
            strawberryCountLabel.text = String(Int(sender.value))
        case .banana:
            bananaCountLabel.text = String(Int(sender.value))
        case .pineapple:
            pineappleCountLabel.text = String(Int(sender.value))
        case .kiwi:
            kiwiCountLabel.text = String(Int(sender.value))
        case .mango:
            mangoCountLabel.text = String(Int(sender.value))
        }
    }
}
