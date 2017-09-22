//
//  ViewController.swift
//  baseballGame
//
//  Created by MIN JUN JU on 2017. 9. 21..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //레이블 모음
    @IBOutlet var disPlayLabel: UILabel!
    @IBOutlet var disPlayLabel1: UILabel!
    @IBOutlet var disPlayLabel2: UILabel!
    
    @IBOutlet var resultDisPlayLabel: UILabel!
    
    //텍스트 레이블(내가 만든것들 로그 추적해서 다시 만들어 보자
    @IBOutlet var textView: UITextView!
    
    // player 생성
    var me: User = User()
    var computer: Computer = Computer()
    
    
    
    // 버튼들 모음
    
    // 시작 버튼
    @IBAction func startBtn(_ btn: UIButton) {
        
        
        resultDisPlayLabel.text = "게임을 시작합니다!"
        textView.text = "난수는: \(me.creatRandomValue())"
        
    }
    
    // reset 초기화 버튼
    @IBAction func resetBtn(_ btn: UIButton) {
        
        //레이블들 초기화
        disPlayLabel.text = ""
        disPlayLabel1.text = ""
        disPlayLabel2.text = ""
        
        resultDisPlayLabel.text = ""
        
        // instance 변수들 초기화
        me.reset()
        computer.reset()

    }
    
    
    
    // 숫자 버튼 함수 생성
    @IBAction func numberBtn(_ btn: UIButton) {

        if me.isRunning {
            resultDisPlayLabel.text = "값을 선택중 입니다.."
            var btnTag = Int((btn.titleLabel?.text)!)
            
            // 인스턴스 함수에 누른 버튼을 인자로 넣어준다.
            me.numberbtn(n: btnTag!)
            
            if me.selectedNumArray.count == 1 {
                disPlayLabel2.text = String(me.selectedNumArray[0])
                
            }else if me.selectedNumArray.count == 2{
                disPlayLabel1.text = String(me.selectedNumArray[1])
                
            }else if me.selectedNumArray.count == 3{
                disPlayLabel.text = String(me.selectedNumArray[2])
                
            }else {
                resultDisPlayLabel.text = me.outputString
            }
            textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는?!"
            
            
            
            print(me.selectedNumArray, me.randomValueArray)
            
        }
    }
    
    // 결과 버튼
    @IBAction func resultBtn(_ btn: UIButton) {
        
        if self.me.isRunning && computer.getUserRandomValue.count == 0 {
            // me 라는 인스턴스 computer가 사용
            
            computer.getUser(n: me)
            
            // 연산위해서 유저의 값을 가져옴
            computer.decompositionValue()
            computer.result()
            
            if computer.out == 3 {
                resultDisPlayLabel.text = "삼진아웃~!"
                textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는?! 삼진아웃~!"
                
                // 레이블 초기화
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
                
                me.selectedNumArray = []
                computer.reset1()
                
                
                
                
            }else if computer.strike == 3 {
                resultDisPlayLabel.text = "3S !!"
                textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는 3S!!!!!!"
                
            }else if computer.strike >= 1 {
                resultDisPlayLabel.text = " \(computer.strike)S, \(computer.ball)B, \(computer.out)O 입니다"
                textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는?! \(computer.strike)S, \(computer.ball)B, \(computer.out)O 입니다"
                
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
                
                me.selectedNumArray = []
                computer.reset1()


                
            }else if computer.strike == 0 {
                resultDisPlayLabel.text = " \(computer.ball)B, \(computer.out)O 입니다"
                textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는?! \(computer.ball)B, \(computer.out)O 입니다"
                
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
                
                me.selectedNumArray = []
                computer.reset1()


                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

