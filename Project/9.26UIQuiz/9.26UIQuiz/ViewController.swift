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
    
    // 1번 문제 프로퍼티
    //let onBtn: UIButton = UIButton(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
    //let offBtn: UIButton = UIButton(frame: CGRect(x: 140, y: 140, width: 100, height: 100))
    
    // 2번 문제 프로퍼티
    //let rectangle: UIButton = UIButton(frame: CGRect(x: 20, y: 20 , width: 100, height: 100))
    //let rectangle1: UIButton = UIButton(frame: CGRect(x: 140, y: 140 , width: 100, height: 100))
    
    // 3번 문제 프로퍼티
    
   /* let rectangle: UIButton = UIButton(frame: CGRect(x: 0, y: 0 , width: 118, height: 215))
    let rectangle1: UIButton = UIButton(frame: CGRect(x: 128, y: 0 , width: 118, height: 215))
    let rectangle2: UIButton = UIButton(frame: CGRect(x: 256, y: 0 , width: 118, height: 215))
    
    let rectangle3: UIButton = UIButton(frame: CGRect(x: 0, y: 225 , width: 118, height: 215))
    let rectangle4: UIButton = UIButton(frame: CGRect(x: 128, y: 225 , width: 118, height: 215))
    let rectangle5: UIButton = UIButton(frame: CGRect(x: 256, y: 225 , width: 118, height: 215))
    
    let rectangle6: UIButton = UIButton(frame: CGRect(x: 0, y: 450 , width: 118, height: 215))
    let rectangle7: UIButton = UIButton(frame: CGRect(x: 128, y: 450 , width: 118, height: 215))
    let rectangle8: UIButton = UIButton(frame: CGRect(x: 256, y: 450 , width: 118, height: 215))
 */
    // UITextFiled
    
    let tf: UITextField = UITextField(frame: CGRect(x: 10, y: 40, width: 300 , height: 40))
    var lb: UILabel!
    
    
    var temp: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 여러가지 문자열을 사용하고 싶으면 textView를 사용하는게좋음.
        // TestField 는 쭈루룩 입력을 받을수 있게 해주는것.
        tf.borderStyle = .line
        
        // 말그대로 pleacholder
        tf.placeholder = "여기에 입력하세요"
        
        
        view.addSubview(tf)
        // 화면에 뿌려주는 함수
        //creatAddSubView()
        
        let okBtn: UIButton = UIButton(type: .detailDisclosure)
        okBtn.frame = CGRect(x: 320, y: 40, width: 50, height: 40)
        okBtn.addTarget(self, action: #selector(ViewController.handlerOKBtn(_:)), for: .touchUpInside)
        
        view.addSubview(okBtn)
        
        lb = UILabel(frame: CGRect(x: 10, y: 90, width: 350, height: 30))
        lb.numberOfLines = 0
        
        view.addSubview(lb)
        
    
        
        
    /*
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
        view.addSubview(rectangle)*/
        
      
        
        /*
        rectangle.backgroundColor = UIColor.blue
        
        rectangle.addTarget(self, action: #selector(self.rectangleBtnAction(_:)), for: .touchUpInside)
        
        view.addSubview(rectangle)
        
        
        
        
        rectangle1.backgroundColor = UIColor.black
        
        view.addSubview(rectangle1)
        */
        
        
        
        
        /*
        onBtn.setTitle("on", for: UIControlState.normal)
        onBtn.setTitle("highlighted", for: UIControlState.highlighted)
        onBtn.setTitle("selected", for: UIControlState.selected)
        
        onBtn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        onBtn.setTitleColor(.white, for: .normal)
        onBtn.setTitleColor(.red, for: .highlighted)
        onBtn.setTitleColor(.green, for: .selected)
        
        
        onBtn.addTarget(self, action: #selector(self.onBtnAction(_:)), for: .touchUpInside)
        
        view.addSubview(onBtn)
        
        
        
        
        
        offBtn.setTitle("off", for: UIControlState.normal)
        offBtn.setTitle("highlighted", for: UIControlState.highlighted)
        offBtn.setTitle("selected", for: UIControlState.selected)
        
        offBtn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        offBtn.setTitleColor(.white, for: .normal)
        offBtn.setTitleColor(.red, for: .highlighted)
        offBtn.setTitleColor(.green, for: .selected)
        
        
        offBtn.addTarget(self, action: #selector(self.offBtnAction(_:)), for: .touchUpInside)
        
        view.addSubview(offBtn)
        */
        
        
        
        
    }
    /*
    @objc func onBtnAction(_ sender:UIButton) {
        
        //내꺼가 눌리고 난 이후에, 상대꺼 안눌림
        sender.isSelected = true
        sender.isUserInteractionEnabled = false
        
        // 내꺼를 누를때 off 버튼의 isSelected 상태를 변화시켜주고, 상대방 버튼을 누를수 있게 만들어줌.
        offBtn.isSelected = false
        offBtn.isUserInteractionEnabled = true
        
    }
    
    @objc func offBtnAction(_ sender:UIButton) {
        
        // 내꺼 selected 가능 상태로,
        sender.isSelected = true
        sender.isUserInteractionEnabled = false
        
        // on 버튼 끄기
        
        onBtn.isSelected = false
        onBtn.isUserInteractionEnabled = true
    } */

    
    
    
    
    
    // view.subview rectangle 던지고, background color 설정
  /*  func creatAddSubView() {
        let viewArray: [UIButton] = [rectangle, rectangle1, rectangle2, rectangle3, rectangle4, rectangle5, rectangle6, rectangle7, rectangle8]
        
        for i in viewArray {
            
            view.addSubview(i)
            i.backgroundColor = UIColor.blue
 
            
        }
        
    }
    
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
    }*/
    
    @objc private func textFieldShouldReturn(_ textfield: UITextfield) {
        
        // 키보드 내리기
        tf.resignFirstResponder()
        
        return true
        
    }
    
    @objc func handlerOKBtn(_ sender: UIButton) {
        
        temp += tf.text! + "\n"
        lb.text = temp
        tf.text = ""
        
        
        
        
        
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

