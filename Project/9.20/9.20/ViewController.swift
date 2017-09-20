//
//  ViewController.swift
//  9.20
//
//  Created by MIN JUN JU on 2017. 9. 20..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(f(a: 10, b: 20))
        print(g(f: f, a: 30, b: 40))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

