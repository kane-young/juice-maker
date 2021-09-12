//
//  orderAlertController.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/19.
//

import UIKit

extension UIViewController {
    func alertOfSuccess(juice: Juice) {
        let alert = UIAlertController(title: "\(juice) 쥬스 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    func alertOfFail() {
        let alert = UIAlertController(title: "재료가 모자라요", message: "재고를 수정할까요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default) { _ in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let stockView = mainStoryboard.instantiateViewController(identifier: "stockVC")
            self.navigationController?.pushViewController(stockView, animated: true)
        }
        let cancel = UIAlertAction(title: "아니오", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}
