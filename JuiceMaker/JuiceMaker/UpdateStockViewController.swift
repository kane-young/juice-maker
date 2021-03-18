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

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backToOrder(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
