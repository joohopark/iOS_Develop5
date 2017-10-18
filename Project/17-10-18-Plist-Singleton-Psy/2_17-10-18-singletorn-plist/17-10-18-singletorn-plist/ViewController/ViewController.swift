//
//  ViewController.swift
//  17-10-18-singletorn-plist
//
//  Created by MIN JUN JU on 2017. 10. 18..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passworTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    

    @IBAction func btnAction(_ sender: UIButton) {
        
        
        // 텍스트 필드값 바인딩
        guard let username = usernameTextField.text, !username.isEmpty else {return}
        guard let password = passworTextField.text, !password.isEmpty else {return}
        
        if getPlistData.sharedInstance.validateUserInfo(username: username, password: password) {
            // 로그인 성공
            print("로그인 성공")

        }else {
        
            print("로그인 실패")
            
            
            
        }
        
        }


        
    }
        

    


