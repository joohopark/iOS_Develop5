//
//  ViewController.swift
//  17-10-16-ClassAndStruct
//
//  Created by MIN JUN JU on 2017. 10. 16..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let name: UIButton = {
            let btn = UIButton()
            btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            btn.backgroundColor = .red
            
            return btn
            
        }()
        
        view.addSubview(name)
        print(view.subviews.count)
        
    }

    


}

