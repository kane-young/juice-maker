//
//  UpdateStockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/17.
//

import UIKit

class UpdateStockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func backToOrder(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}
