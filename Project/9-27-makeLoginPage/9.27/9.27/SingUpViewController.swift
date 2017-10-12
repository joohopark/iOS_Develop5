//
//  SingUpViewController.swift
//  9.27
//
//  Created by MIN JUN JU on 2017. 9. 27..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class SingUpViewController: UIViewController {
    
    // closure 생성
    var didTaskClosure: ((String, String) -> Void)? = nil
    
    // Account TextField IBOutlet
    @IBOutlet weak var accountUserName: UITextField!
    @IBOutlet weak var accountPassWord: UITextField!
    @IBOutlet weak var accountCheckPassWord: UITextField!
    
    
    // signUpviewController 에서 뒤로가는 버튼을 누르면 호출되는 함수.
    @IBAction func didtapExitButton(_ sender: UIButton) {
        
        //dismiss 되고나서, 해제되고나서, animated 를 줄거냐 말것이냐
        dismiss(animated: true, completion: nil)
        
    }
    
    
    

    // 회원가입 페이지의 creat 버튼을 누르면 실행 되는 함수 
    @IBAction func creatNewAccount(_ sender: UIButton) {
        
        // guard let 의 강력한점.. 이렇게 쓰면 굉장히 강력하구나.. 오호.. 
        guard let username = accountUserName.text else { return }
        guard let password = accountPassWord.text else { return }
        guard let checkpassword = accountCheckPassWord.text else { return }
        
        print(username, password, checkpassword)
        
        if password == checkpassword {
            
            // 아래의 실행문에서, 클로져에 이름과, 패스워드를 실행해서 값을 가지고 있고, 
            didTaskClosure?(username, password)
            
            // 성공하면 화면전환?
            dismiss(animated: true, completion: nil)
        }else {
            print("패스워드 두개가 같지 않습니다")
        }
        
        
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 회원가입 페이지에서 데이터를 작성하고, 엔터키를 누르면, 키보드가 내려감.
        accountUserName.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        
        accountPassWord.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        
        accountCheckPassWord.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)

        // Do any additional setup after loading the view.
    }
    
    @objc func didEndOnExit(_ sender: UITextField) {
        
        
        // 각각 한줄 한줄 input 값을 입력하고, 엔터키를 누르면, 바로 아래의 textfield로 넘어감. 
        if sender === accountUserName {
            accountPassWord.becomeFirstResponder()
            
        }else {
            accountCheckPassWord.becomeFirstResponder()
        }
        
        // 리턴을 누르면, accountcheckPassword 필드로 커서가 이동을 한다.
        //accountCheckPassWord.becomeFirstResponder()
        print("exit")
    }
    
    
    
    

    
}
