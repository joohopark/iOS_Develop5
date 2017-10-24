//
//  ViewController.swift
//  CreatLogin1
//
//  Created by MIN JUN JU on 2017. 9. 27..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //TextField 
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    // userData
    var userData: [[String:String]] = [
        ["name": "minjun", "password": "4321"],
    ]
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginActionButton(_ sender: UIButton) {
        print("로그인 버튼")
        
        guard let userName = userNameTextField.text else {return}
        guard let passWord = passWordTextField.text else {return}
    
        
        if !userName.isEmpty && !passWord.isEmpty {
            
            let popAlert: UIAlertController = UIAlertController(title: "로그인 성공", message: "음..", preferredStyle: .alert)
            
//            let okAlerAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (a) in
//
//
//                print("로그인성공")
//
//                // 로그인시. 로그인이 되었는지 확인하기 위해서, korKey를 true를 둠...!
//                UserDefaults.standard.set(true, forKey: "isLogined")
//                self.dismiss(animated: true, completion: nil)
//            })
            
//            popAlert.addAction(okAlerAction)
            
            self.present(popAlert, animated: true, completion: nil)
            
            
        }
        

    }
    
    // creatAccount 버튼
    @IBAction func CreatAccountActionButton(_ sender: UIButton) {
        
       UserDefaults.standard.set(true, forKey: "isLogin")
        //dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(UserDefaults.standard.object(forKey: "userList"))
        dump(UserDefaults.standard.object(forKey: "userList"))
    }
    
    
    
    
    
}

