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
        
        // 로그인 체크 -> checkData 에, userDefualts 로 가지고 있는 옵셔널 값을 [[String:String]] 로 바꾸어주었음..!
        guard let checkData:[[String:String]] = UserDefaults.standard.object(forKey: "userList") as? [[String:String]] else {
            return
            
        }
        
        /*if userNameTextField.text == checkData["ID"] {
            if passWordTextField.text == checkData[["PW"]] {
                print("로그인 성공")
            }else {
                print("비밀번호가 틀립니다.")
            }
        }*/

        print(checkData)
        for i in checkData {
            
            if i["ID"] == userName {
                if i["PW"] == passWord {
                    // 1. 알럿컨트롤러 설정
                    let alertControllor: UIAlertController = UIAlertController(title: "알럿 타이틀 입니다.", message: "알럿 메세지 입니다", preferredStyle: .alert)
                    
                    // 2. 알럿 액션 버튼 설정
                    
                    let okActionAlert: UIAlertAction = UIAlertAction(title: "OK", style: .default) { (alert) in
                        
                        print("ok 버튼을 눌렀다.")
                    }
                    
                    // 2-1. 알럿 액션 버튼 설정
                    let cancelActionAlert: UIAlertAction = UIAlertAction(title: "cancel", style: .default) { (alert) in
                        print("cancel 버튼을 눌렀다.")
                    }
                    
                    
                    // 3. 알럿 액션을 알럿 컨트롤러에 추가 해줘야함
                    
                    
                    
                    alertControllor.addAction(okActionAlert)
                    
                    alertControllor.addAction(cancelActionAlert)
                    
                    
                    // 알럿을 뷰에 뿌려 줘야함.
                    
                    self.present(alertControllor, animated: true, completion: nil)
                    
                    print("로그인 성공")
                    
                }else {
                    print("비밀번호가 틀립니다.")
                }
                
            }else {
                print("아이디가 없습니다. 아이디를 생성하세요")
            }
        }
        
        
        
        
        
    }
    
    // creatAccount 버튼
    @IBAction func CreatAccountActionButton(_ sender: UIButton) {
        
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(UserDefaults.standard.object(forKey: "userList"))
    }
    
    
    
    
    
}

