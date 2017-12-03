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
    
    //변수 모음
    var isRunning:Bool = false
    var randomValueArray:[Int] = []
    var selectedNumArray:[Int] = []
    
    // 시작 버튼
    @IBAction func startBtn(_ btn: UIButton) {
        isRunning = true
        //randomValueArray에 난수 생성
        creatRandomValue()
        // text view 에 보여지는 모습 출ㄹ
        textView.text = "\(randomValueArray)"
        resultDisPlayLabel.text = "start game 뾰로롱~!"
    }
    
    // 난수를 생성하는 함수를 호출 함
    func creatRandomValue() -> [Int] {
        while randomValueArray.count <= 2 {
            var randomValue1 = Int(arc4random_uniform(10))
            if !randomValueArray.contains(randomValue1) {
                randomValueArray.append(randomValue1)
            }
        }
        return randomValueArray
    }
    // reset 초기화 버튼
    @IBAction func resetBtn(_ btn: UIButton) {
        
        // 레이블, 텍스트 초기화
        disPlayLabel.text = ""
        disPlayLabel1.text = ""
        disPlayLabel2.text = ""
        resultDisPlayLabel.text = "대기중 입니다.."
        textView.text = "게임이 초기화 되었습니다..."
        
        // 변수 초기화
        randomValueArray = []
        selectedNumArray = []
        
        
    }
    
    // 숫자 버튼 함수 생성
    @IBAction func numberBtn(_ btn: UIButton) {
        
        if isRunning {
            var btnTag = Int((btn.titleLabel?.text)!)
            
            if selectedNumArray.count == 0 {
                selectedNumArray.append(btnTag!)
                disPlayLabel2.text = String(selectedNumArray[0])
                
            }else if selectedNumArray.count == 1 && !selectedNumArray.contains(btnTag!) {
                selectedNumArray.append(btnTag!)
                disPlayLabel1.text = String(selectedNumArray[1])
                
            }else if selectedNumArray.count == 2 && !selectedNumArray.contains(btnTag!){
                selectedNumArray.append(btnTag!)
                disPlayLabel.text = String(selectedNumArray[2])
                textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 결과는?"
                
            }else if selectedNumArray.count >= 3 && !selectedNumArray.contains(btnTag!){
                resultDisPlayLabel.text = "이제그만.."
            }
            print(selectedNumArray, randomValueArray)
            
        }
        
    }
    
    @IBAction func resultBtn(_ btn: UIButton) {
        var strike = 0
        var ball = 0
        var out = 0
        
        if isRunning {
            
            for i in 0...2 {
                
                // 선택한 값이 랜덤값안에 있으면,
                if randomValueArray.contains(selectedNumArray[i]) {
                    
                    if selectedNumArray[i] == randomValueArray[i] {
                        strike += 1
                        
                    }else {
                        ball += 1
                    }
                    
                }else {
                    out += 1
                }
            }
            print(strike, ball, out)
        }
        
        if out == 3 {
            resultDisPlayLabel.text = "삼진아웃~!"
            textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 결과는? 삼진 아웃!"
            
        }else if strike == 3 {
            resultDisPlayLabel.text = "3S !!"
            textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 3S !!"
            
        }else if strike >= 1 {
            resultDisPlayLabel.text = " \(strike)S, \(ball)B, \(out)O 입니다"
            textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 결과는? \(strike)S, \(ball)B, \(out)O 입니다"
        }else if strike == 0 {
            resultDisPlayLabel.text = " \(ball)B, \(out)O 입니다"
            textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 결과는?  \(ball)B, \(out)O 입니다"
            
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

