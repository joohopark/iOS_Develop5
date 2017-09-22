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
    @IBOutlet var textView: UITextView!
    
    //변수 모음
    
    //var disPlayLBArray: [UILabel] = []
    var isRunning:Bool = false
    var clickBtnNumber = 0
    
    var randomValueArray:[Int] = []  // 난수 생성
    var selectedNumArray:[Int] = []
    
    var ballValue = 0
    var strikeValue = 0
    
    
    

 
    
    
    // 함수 모음
    
    // 시작 버튼
    @IBAction func startBtn(_ btn: UIButton) {
        
        // 게임 러닝 알려주는 변수 클릭.
        isRunning = true
        
        
        // 3자리 중복 없는 난수 생성
        while randomValueArray.count < 3 {
            
            var randomValue = Int(arc4random_uniform(10))
            
            if !randomValueArray.contains(randomValue) {
                randomValueArray.append(randomValue)
                
                
            }
        }
        resultDisPlayLabel.text = "게임 시작 뾰로롱~!"
        textView.text = "\(randomValueArray)"

      

    }
    
    @IBAction func numberBtn(_ btn: UIButton) {
        
        
        
        // 게임이 실행중 일때만 버튼이 눌림.
        if isRunning {
            clickBtnNumber += 1
            var btnTagNumber = Int(btn.tag)
            
            if clickBtnNumber == 1 {
                selectedNumArray.append(btnTagNumber)
                disPlayLabel2.text = String(selectedNumArray[0])
                
            }else if clickBtnNumber == 2 {
                
                // 숫자가 중복이면, clickBtn을 이전으로 돌리고, 다시 돈다.
                if selectedNumArray.contains(btnTagNumber) {
                    clickBtnNumber = 1
                }else {
                    selectedNumArray.append(btnTagNumber)
                    disPlayLabel1.text = String(selectedNumArray[1])
                }
                
            }else if clickBtnNumber == 3 {
                
                if selectedNumArray.contains(btnTagNumber) {
                    clickBtnNumber = 2
                }else {
                    selectedNumArray.append(btnTagNumber)
                    disPlayLabel.text = String(selectedNumArray[2])
                    
                }
                
            }else if clickBtnNumber > 3 {
                resultDisPlayLabel.text = "이제 고만눌러.."
                clickBtnNumber = 4
                
            }
        }
        print(isRunning, clickBtnNumber, selectedNumArray, randomValueArray)
        
    }
    
    @IBAction func resetBtn(_ btn: UIButton) {
        disPlayLabel.text = ""
        disPlayLabel1.text = ""
        disPlayLabel2.text = ""
        resultDisPlayLabel.text = "대기중 입니다.."
        isRunning = false
        
        clickBtnNumber = 0
        randomValueArray = []
        selectedNumArray = []
        
        ballValue = 0
        strikeValue = 0
        
        
    }
    @IBAction func resultBtn(_ btn: UIButton) {
        
        
        // 게임이 실행중일때 작동함 
        if isRunning && clickBtnNumber >= 3 {
            
            // 스트라이크가 없을떄
            
            // 스트라이크가 없고, 내부에 볼이 있을때
            if selectedNumArray[0] != randomValueArray[0] && selectedNumArray[1] != randomValueArray[1] && selectedNumArray[2] != randomValueArray[2] {
                
                if randomValueArray.contains(selectedNumArray[0]) == true || randomValueArray.contains(selectedNumArray[1]) == true || randomValueArray.contains(selectedNumArray[2]) == true {
                    
                    for i in selectedNumArray {
                        if randomValueArray.contains(i) {
                            ballValue += 1
                        }

                        
                    }
                    resultDisPlayLabel.text = "\(ballValue)B 입니다."
                    strikeValue = 0
                    ballValue = 0
                    
                    clickBtnNumber = 0
                    selectedNumArray = []
                    
                    disPlayLabel.text = ""
                    disPlayLabel1.text = ""
                    disPlayLabel2.text = ""
                    
                    
                }else {
                    resultDisPlayLabel.text = "운이 없으시네요.."
                    strikeValue = 0
                    ballValue = 0
                    clickBtnNumber = 0
                    selectedNumArray = []
                    
                    disPlayLabel.text = ""
                    disPlayLabel1.text = ""
                    disPlayLabel2.text = ""
                    
                }
                
                
            // 스트라이크가 하나 일때.
            }else if selectedNumArray[0] == randomValueArray[0] && selectedNumArray[1] != randomValueArray[1] && selectedNumArray[2] != randomValueArray[2] {
                
                strikeValue = 1
                
                for i in selectedNumArray {
                    
                    if randomValueArray.contains(i) {
                        ballValue += 1
                    }

                }
                
                resultDisPlayLabel.text = "\(strikeValue)S, \(ballValue)B 입니다"
                strikeValue = 0
                ballValue = 0
                
                clickBtnNumber = 0
                selectedNumArray = []
                
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
                
                
            // 스트라이크 두개 일때
            }else if selectedNumArray[0] == randomValueArray[0] && selectedNumArray[1] == randomValueArray[1] && selectedNumArray[2] != randomValueArray[2] {
                
                strikeValue = 2
                
                for i in selectedNumArray {
                    
                    if randomValueArray.contains(i) {
                        ballValue += 1
                    }
                }
                resultDisPlayLabel.text = "\(strikeValue)S, \(ballValue)B 입니다."
                strikeValue = 0
                ballValue = 0
                
                clickBtnNumber = 0
                selectedNumArray = []
                
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
                

             // 스트라이크 3개 일때
            }else if selectedNumArray[0] == randomValueArray[0] && selectedNumArray[1] == randomValueArray[1] && selectedNumArray[2] == randomValueArray[2] {
                strikeValue = 3
                
                resultDisPlayLabel.text = "\(strikeValue)S,입니다."
                strikeValue = 0
                ballValue = 0
                
                clickBtnNumber = 0
                selectedNumArray = []
                
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
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

