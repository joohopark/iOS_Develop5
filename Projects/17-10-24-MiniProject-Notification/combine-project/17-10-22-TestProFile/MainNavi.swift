//
//  MainNavi.swift
//  17-10-22-TestProFile
//
//  Created by MIN JUN JU on 2017. 10. 24..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class MainNavi: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaults.standard.set(false, forKey: "isLogined")

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if !UserDefaults.standard.bool(forKey: "isLogined") {
            //showLoginPage()
            
            performSegue(withIdentifier: "LoginSegue", sender: nil)
            
            
        }
        
        
    }

    

}
