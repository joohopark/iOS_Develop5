//
//  ViewController.swift
//  9.26UIQuiz
//
//  Created by MIN JUN JU on 2017. 9. 26..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

// 프로토콜 체택해야함
class ViewController: UIViewController, UITextFieldDelegate {
    
  
    // 3번 문제 프로퍼티
    
    let rectangle: UIButton = UIButton(frame: CGRect(x: 0, y: 0 , width: 118, height: 215))
    let rectangle1: UIButton = UIButton(frame: CGRect(x: 128, y: 0 , width: 118, height: 215))
    let rectangle2: UIButton = UIButton(frame: CGRect(x: 256, y: 0 , width: 118, height: 215))
    
    let rectangle3: UIButton = UIButton(frame: CGRect(x: 0, y: 225 , width: 118, height: 215))
    let rectangle4: UIButton = UIButton(frame: CGRect(x: 128, y: 225 , width: 118, height: 215))
    let rectangle5: UIButton = UIButton(frame: CGRect(x: 256, y: 225 , width: 118, height: 215))
    
    let rectangle6: UIButton = UIButton(frame: CGRect(x: 0, y: 450 , width: 118, height: 215))
    let rectangle7: UIButton = UIButton(frame: CGRect(x: 128, y: 450 , width: 118, height: 215))
    let rectangle8: UIButton = UIButton(frame: CGRect(x: 256, y: 450 , width: 118, height: 215))
 
    // UITextFiled
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        
    
        rectangle.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        
        rectangle1.tag = 1
        rectangle1.addTarget(self, action: #selector(self.rectangle1Action(_:)), for: .touchUpInside)
        
        rectangle2.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        view.addSubview(rectangle)
        
    ////////////////////////////// 2번째칸
        
        rectangle3.tag = 3
        rectangle3.addTarget(self, action: #selector(self.rectangle1Action(_:)), for: .touchUpInside)
        
        rectangle4.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        view.addSubview(rectangle)
        
        rectangle5.tag = 5
        rectangle5.addTarget(self, action: #selector(self.rectangle1Action(_:)), for: .touchUpInside)
        
    //////////////////////////////// 3번째 칸
        
        rectangle6.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        view.addSubview(rectangle)
        
        rectangle7.tag = 7
        rectangle7.addTarget(self, action: #selector(self.rectangle1Action(_:)), for: .touchUpInside)
        
        rectangle8.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        view.addSubview(rectangle)
        
      
        
        
        
 
        
        
        
        
     
    
    // 0,2,4,6,8, 기능 구현
    @objc func rectangleAction(_ sender:UIButton) {
        
        if sender.backgroundColor == UIColor.blue {
            
            rectangle.backgroundColor = UIColor.darkGray
            rectangle2.backgroundColor = UIColor.darkGray
            rectangle4.backgroundColor = UIColor.darkGray
            rectangle6.backgroundColor = UIColor.darkGray
            rectangle8.backgroundColor = UIColor.darkGray
            
        }else {
            rectangle.backgroundColor = UIColor.blue
            rectangle2.backgroundColor = UIColor.blue
            rectangle4.backgroundColor = UIColor.blue
            rectangle6.backgroundColor = UIColor.blue
            rectangle8.backgroundColor = UIColor.blue
            
        }
    }
    
    // 1,3,5,7 기능 구현
    
    @objc func rectangle1Action(_ sender:UIButton) {
        if sender.backgroundColor == UIColor.blue {
            
            switch sender.tag {
                case 1:
                rectangle1.backgroundColor = UIColor.darkGray
                case 3:
                rectangle3.backgroundColor = UIColor.darkGray
                case 5:
                rectangle5.backgroundColor = UIColor.darkGray
                case 7:
                rectangle7.backgroundColor = UIColor.darkGray
            default:
                print("없는 범위 입니다.")
            }
        }else {
            
            switch sender.tag {
            case 1:
                rectangle1.backgroundColor = UIColor.blue
            case 3:
                rectangle3.backgroundColor = UIColor.blue
            case 5:
                rectangle5.backgroundColor = UIColor.blue
            case 7:
                rectangle7.backgroundColor = UIColor.blue
            default:
                print("없는 범위 입니다.")
            }

            
            
            
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 2 번 문제 해결 ! 9개 인스턴스 만들면됨.
   /* @objc func rectangleBtnAction(_ sender:UIButton) {
        
        if rectangle.backgroundColor == UIColor.blue {
            rectangle.backgroundColor = UIColor.darkGray
        }else {
            rectangle.backgroundColor = UIColor.blue
        }
    }*/


}

