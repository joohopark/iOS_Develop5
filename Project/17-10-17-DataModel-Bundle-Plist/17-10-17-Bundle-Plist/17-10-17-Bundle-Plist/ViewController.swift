//
//  ViewController.swift
//  17-10-17-Bundle-Plist
//
//  Created by MIN JUN JU on 2017. 10. 17..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var x: SingletonClass?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Plist 를 생성하면 맨처음에 bundle에 저장이 된다 .
        
        // forResource 는 plist 이름, ofType는 확장자
        // ',' 를 사용하면
        if let path = Bundle.main.path(forResource: "UserPlist", ofType: "plist"), let dic = NSDictionary(contentsOfFile: path) as? [String:String] {
            
            // 바인딩한 dic의 값을(조건)을 불러올수 있다. 
            print(dic)
            
            
        }
        
        
        for i in Bundle.allBundles {
            
            print(i)
        }
        //print(Bundle.allBundles.count)
        
        x = SingletonClass()
        
        dump(x)
        
        
        
    }



}

