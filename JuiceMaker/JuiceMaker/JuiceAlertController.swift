//
//  JuiceAlertController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/17.
//

import UIKit

class JuiceAlertController: UIAlertController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alertOfSuccessmakeJuice(using juice: Juice) -> UIAlertController {
        let alert = UIAlertController(title: "\(juice.rawValue) 쥬스 나왔습니다", message: "맛있게 드세요!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        return alert
    }
    
    func alertOfFail() -> UIAlertController {
        let alert = UIAlertController(title: "재료가 모자라요", message: "재고를 수정할까요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = mainStoryboard.instantiateViewController(identifier: "mainVC")
            
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "StockVC") else {
                return
            }
            
            mainVC.present(uvc, animated: false, completion: nil)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        return alert
    }

}
