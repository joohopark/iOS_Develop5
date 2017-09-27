//
//  LoginViewController.swift
//  9.27
//
//  Created by MIN JUN JU on 2017. 9. 27..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    // 구조체로 사용한것을 인스턴스로 만듬.
    var userModel = UserModel()
    
    
    // textfield 를 연결함.
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // button의 IBOutlet 을 연결 함.., 프로퍼티로 접근하기위해서는 IBOutlet도 연결 해주어야함.
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // login 버튼을 누를때마다, 아래의 함수가 실행됨.
    @IBAction func loginButtonAction(_ sender: UIButton) {
        
        // userNAmeTextField 의 값이 nill이 아니면, username 에 바인딩하고, 아니면 else 구문이 실행됨
        // guard 문을 사용하는 이유는, userNameTextField가 옵셔널인데, 강제 언렙핑 안하고, 가드문을 사용해줌.
        
        // ********* 가드문과, if let 의 차이점은 , guard let 의 범위는 그 함수 내의 모든곳에서 사용이 가능한데, if let 은 if let 의 조건이 만족될때, 그 내부 에서만 사용이 가능하다..! *********
        
        // 바인딩을 하고, 콤마 이후에 바로 실행을 처리할수 있다.
        guard let username = userNameTextField.text, !username.isEmpty else { return }
        
        
        guard let password = passwordTextField.text else { return }
        
        // 구조체를 이용해서, 데이터 스트럭트를 만듬. 이것을 인스턴스의 함수로 실행함.. 오..
        //userModel.findUser(name: username, password: password)
        
        let isLoginSucces: Bool = userModel.findUser(name: username, password: password)
        
        
        if isLoginSucces {
            print("로그인 성공!")
            
            //화면 전환.
            let main = MainViewController()
            present(main, animated: true, completion: nil)
            
            
        } else {
            
//            // 로그인 실패시, textfield 창에 색상을 주어서, 뭔가 잘못됬다는것을 알림. textField 의 색상을 변경시킴
//            userNameTextField.backgroundColor = UIColor.red.withAlphaComponent(5)
//            passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(5)
            
            // 다른 방식으로 구현함
            // 창이 좌우로 움직이게 하는것 구현함
            UIView.animate(withDuration: 0.05, animations: {
                self.userNameTextField.frame.origin.x -= 10
                self.passwordTextField.frame.origin.x -= 10
            }, completion: { _ in
                UIView.animate(withDuration: 0.05, animations: {
                    self.userNameTextField.frame.origin.x += 20
                    self.passwordTextField.frame.origin.x += 20
                }, completion: { _ in
                    UIView.animate(withDuration: 0.05, animations: {
                        self.userNameTextField.frame.origin.x -= 10
                        self.passwordTextField.frame.origin.x -= 10
                    })
                })
            })
        }
        
            
        
    }
    // 세그웨이가 자기 할일은 하기 직전에 호출이 되는 녀석임. 화면전환 바로 직전에 일어나는 일. 세그웨이는 이전 실행전의 값들을 가지고 있음.
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // closure 는 SingUpViewController 이라는 타입으로 변경시켜주기 위해서, as? 를 사용해서 형 변환을하고, 그 형변환을 하고 난이후에, 'nextViewController' 을 'SingUpViewController' 타입으로 변경 시키고, didTaskClouser 를 실행 시켜서, 기능과, 반환을 정해서 계속 던져줌.
    if let nextViewController = segue.destination as? SingUpViewController {
            nextViewController.didTaskClosure = { ( name:String, password: String) -> Void in
                
                self.userModel.addUser(name: name, password: password)
                
                
            }
            
        }
        
        
    }
    
}
