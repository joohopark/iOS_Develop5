//
//  ViewController.swift
//  Calculator1
//
//  Created by MIN JUN JU on 2017. 9. 16..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var disPlayLabel: UILabel! // 내가만든 레이블을 이녀석과 연결 한다.
    
    var disPlayText:String = ""             // 인풋값들이 스트링으로 저장되는곳.
    var strBtn:String = ""                  // (+,-,*,/) 연산자를 스트링으로 변환후, operatorArea 에 넣어줌
    var intIntputValue:Int = 0              // disPlayText -> Int로 변환후 1차 계산
    var intIntputValueArea:Int = 0          // 연산자 구역에, 다른 연산자가 들어오면, disPlayText의 값을 변환하기위해 disPlayText의 값이 머무르고 계산되는곳/.
    var operatorArea:String = ""            // 연산자가 머무르는곳,
    
    @IBAction func btnNumberClick(btn: UIButton) {
        if btn.titleLabel?.text == "+" ||
            btn.titleLabel?.text == "-" ||
            btn.titleLabel?.text == "*" ||
            btn.titleLabel?.text == "/" ||
            btn.titleLabel?.text == "="  {
            if disPlayText == "" {
                return disPlayLabel.text = "다른거 눌러라.."
            }
        } // 맨처음, 연산기호 눌렀을때. 예외처리
        
        if disPlayLabel.text == "0" {// 계산기 처음에 0000누르는경우 예외처리.
            disPlayText = (btn.titleLabel?.text)!
        }else if btn.titleLabel?.text == "+" { // displaytext에 연산기호가 오면 disPlayText에 추가하지 않음.
        }else if btn.titleLabel?.text == "-" {
        }else if btn.titleLabel?.text == "*" {
        }else if btn.titleLabel?.text == "/" {
        }else if btn.titleLabel?.text == "=" {
        }else {
            disPlayText += (btn.titleLabel?.text)!
        }
        disPlayLabel.text = disPlayText
        if btn.titleLabel?.text == "+" ||
            btn.titleLabel?.text == "-" ||
            btn.titleLabel?.text == "*" ||
            btn.titleLabel?.text == "/"  { // 연산자 눌렀을때 실행되는 함수.
            if operatorArea == "" {                      // 맨처음 연산자를 만났을때 처리.
                operatorArea += (btn.titleLabel?.text)! // 연산자 구역에 연산자 추가
                intIntputValue = Int(disPlayText)!      // input값을 int형으로 변환
                disPlayText = ""                        // disPlayText를 인트형 변환후 초기화.
                
            }else if operatorArea == "+" { //두번째 연산자가 operatorArea아 "+" 인경우.
                strBtn = (btn.titleLabel?.text)!      //strBtn에, 현재 연산자를 넣고
                operatorArea = strBtn                 //operatorArea 에 현재 연산자 기호를 넣고
                intIntputValueArea = Int(disPlayText)!  // intIntputValueArea 에, displayText의 값을 int로 변환후,
                disPlayText = ""                       // 콘솔창에 보여지는 값 초기화.
                intIntputValue += intIntputValueArea   // input 값의 두 구역 연산.
                disPlayLabel.text = String(intIntputValue) // 연산한 값 콘솔창에 표시.
                intIntputValueArea = 0                     // 두번쨰 연산 구역 초기화.
                
            }else if operatorArea == "-" { //operatorArea아 "+" 인경우.
                strBtn = (btn.titleLabel?.text)!
                operatorArea = strBtn
                intIntputValueArea = Int(disPlayText)!
                disPlayText = ""
                intIntputValue -= intIntputValueArea
                disPlayLabel.text = String(intIntputValue)
                intIntputValueArea = 0
                
            }else if operatorArea == "*" { //operatorArea아 "+" 인경우.
                strBtn = (btn.titleLabel?.text)!
                operatorArea = strBtn
                intIntputValueArea = Int(disPlayText)!
                disPlayLabel.text = String(intIntputValue)
                disPlayText = ""
                intIntputValue *= intIntputValueArea
                disPlayLabel.text = String(intIntputValue)
                intIntputValueArea = 0
            }else if operatorArea == "/" { //operatorArea아 "+" 인경우.
                strBtn = (btn.titleLabel?.text)!
                operatorArea = strBtn
                intIntputValueArea = Int(disPlayText)!
                disPlayText = ""
                intIntputValue /= intIntputValueArea
                disPlayLabel.text = String(intIntputValue)
                intIntputValueArea = 0
            }
        }
        else if btn.titleLabel?.text == "=" {   // 연산자 = 을 만낫을때, 연산 구역 1,2 연산후, 모든값 초기화.
            if operatorArea == "+" { //operatorArea이 "+" 인경우.
                intIntputValueArea = Int(disPlayText)!
                intIntputValue += intIntputValueArea
                disPlayLabel.text = String(intIntputValue) // 모든것들 연산후, 초기화
                disPlayText = ""
                intIntputValueArea = 0
                //operatorArea = "+"
                
            }else if operatorArea == "-" { //operatorArea아 "+" 인경우.
                intIntputValueArea = Int(disPlayText)!
                intIntputValue -= intIntputValueArea
                disPlayLabel.text = String(intIntputValue)
                disPlayText = ""
                intIntputValueArea = 0
                //operatorArea = "-"
                
            }else if operatorArea == "*" { //operatorArea아 "+" 인경우.
                intIntputValueArea = Int(disPlayText)!
                disPlayLabel.text = String(intIntputValue)
                intIntputValue *= intIntputValueArea
                disPlayLabel.text = String(intIntputValue)
                disPlayText = ""
                intIntputValueArea = 0
                //operatorArea = "*"
                
            }else if operatorArea == "/" { //operatorArea아 "+" 인경우.
                intIntputValueArea = Int(disPlayText)!
                intIntputValue /= intIntputValueArea
                disPlayLabel.text = String(intIntputValue)
                disPlayText = ""
                intIntputValueArea = 0
                //operatorArea = "/"
            }
        }
    }
    
    @IBAction func resetBtn(btn: UIButton) {
        disPlayText = ""
        intIntputValue = 0
        intIntputValueArea = 0
        operatorArea = ""
        disPlayLabel.text = disPlayText
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

