//
//  ViewController.swift
//  10.11
//
//  Created by MIN JUN JU on 2017. 10. 11..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var testbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func pushAction() {
        
        let nextVC = UIViewController()
        
        // 네비게이션 컨트롤러 프로퍼티에 각 뷰 컨트롤러가 요청을 해야 push가 이루어짐.이유는, 어차피 스텍 구조이니가, navi에 쌓여 있는 구조 그대로 가져 갈수 있음.
        self.navigationController?.pushViewController(nextVC, animated: true)
        print("pushAction")
    }
    
    func popAction() {
        self.navigationController?.popViewController(animated: true)
        print("popAction")
    }
    
    
}

