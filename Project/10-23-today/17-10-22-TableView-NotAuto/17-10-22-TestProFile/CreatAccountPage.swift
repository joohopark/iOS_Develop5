//
//  CreatAccountPage.swift
//  CreatLogin1
//
//  Created by MIN JUN JU on 2017. 9. 27..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class CreatAccountPage: UIViewController {
    
    // userData -> 그냥 인스턴스를 만들고, 자료값을 추가하면, 회원가입페이지에 넘어갔을때는, 자료값이 사라졌음..
    
        
   
    
    //textfield 모음
    @IBOutlet weak var accountUserNameTextField: UITextField!
    @IBOutlet weak var accountPassWordTextField: UITextField!
    @IBOutlet weak var accountCheckPassWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }

    
    //exit 버튼
    @IBAction func didTapExitActionButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //cerat Account 버튼
    @IBAction func creatNewAccountActionButton(_ sender: UIButton) {
        
        guard let userName = accountUserNameTextField.text else { return }
        guard let passWord = accountPassWordTextField.text else { return }
        guard let checkPassWord = accountCheckPassWordTextField.text else { return }
        
        if passWord != checkPassWord {
            print("비밀번호가 같지 않습니다")
            
            accountPassWordTextField.text = ""
            accountCheckPassWordTextField.text = ""
            
            
            return 
        }else {
            // 데이터를 유저 디폴트 값으로 저장함, 최종적으로 [[String: String]] 로 만들고 싶은데, 좀더 직관적으로 하기위해서, 하위 데이터를 나누었다.
            let userData:[String:String] = ["ID":userName, "PW":passWord]
            let list:[[String:String]] = [userData]
            
            
            // 최종적으로 UserDefaults 안에, userList -> [[String: String]] 값에, [String: String] 값이 들어갔다.
            UserDefaults.standard.set(list, forKey: "userList")
            
            print(userData,list, UserDefaults.standard.object(forKey: "userList"))
            
            
            /*guard var userList = UserDefaults.standard.array(forKey: "data") as? [[String: String]] else { return }
            
            for dictionary in userList {
                if dictionary["name"] == userName && dictionary["password"] == passWord {
                    
                    let resultList = userList.append(["name": userName, "password": passWord])
                    UserDefaults.standard.set(resultList, forKey: "data")
                }
            }*/
            
            
            
    
            //데이터 추가후 화면전환
            dismiss(animated: true, completion: nil)
            
        }

        
    }
    
}
