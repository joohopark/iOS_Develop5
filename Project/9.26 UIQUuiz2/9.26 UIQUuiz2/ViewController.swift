//
//  ViewController.swift
//  9.26 UIQUuiz2
//
//  Created by MIN JUN JU on 2017. 9. 26..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // textField 생성
    let tf: UITextField = UITextField(frame: CGRect(x: 10, y: 40, width: 300 , height: 40))
    
    //ok 버튼생성
    let okBtn: UIButton = UIButton(type: .detailDisclosure)
    
    //label 생성
    
    let lb: UILabel = UILabel(frame: CGRect(x: 10, y: 90, width: 300, height: 300))
    
    // label 에 표시해줄 텍스트 프로퍼티 생성
    
    var temp: String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField
        tf.placeholder = "여기에다"
        tf.borderStyle = .line
        view.addSubview(tf)
        
        //okbtn
        okBtn.frame = CGRect(x: 320, y: 40, width: 50, height: 40)
        
        okBtn.addTarget(self, action: #selector(ViewController.okBtnAction(_:)), for: .touchUpInside)
        view.addSubview(okBtn)
        
        //label
        
        lb.backgroundColor = UIColor.brown
        view.addSubview(lb)
        
        // lines 를 설정해줘야지 label의 라인을 무한정 사용할수 있다.
        lb.numberOfLines = 0
        
        // 델리게이트 설정
        
        // delegate 를 자기자신으로 인스턴스를 만들어서, 아래에있는 함수를 실행하게 했다고 지금은 이해하자..
        tf.delegate = self
        
    }
    
    @objc func okBtnAction(_ sender: UIButton) {
        
        temp += tf.text! + "\n"
        lb.text = temp
        tf.text = ""
        
        print(temp, lb.text)
        
    }
    
    
    
    // 키보드를 올렸다가, 사라지게 하는 함수..
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        tf.resignFirstResponder()
        
        return true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

