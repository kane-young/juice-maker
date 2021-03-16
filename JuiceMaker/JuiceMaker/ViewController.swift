//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet var orderBananaJuice: UIButton!
    var juiceMaker = JuiceMaker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    } // 처음 화면이 시작될때 요구하는것을 넣을 수 있는 함수

    override func viewWillAppear(_ animated: Bool) {
        
    } // 함수가 다른 화면 넘어 갔다가 다시 돌아왔을 때
    
    @IBAction func pushButton1(_ sender: UIButton) {
        do{
            try juiceMaker.makeJuice(using: .banana)
            let alert = UIAlertController(title: "바나나 쥬스 완성", message: "맛있게 드세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: false, completion: nil)
        } catch {
            let alert = UIAlertController(title: "재고 부족", message: "바나나가 부족합니다", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

