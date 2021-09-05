//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class StockViewController: UIViewController {
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

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func touchUpClosedButton(_ sender: Any) {
    self.presentingViewController?.dismiss(animated: false, completion: nil)
  }
}
