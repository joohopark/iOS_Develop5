//
//  user.swift
//  baseballGame
//
//  Created by MIN JUN JU on 2017. 9. 22..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation


class User {
    
    var randomValueArray:[Int] = []
    var isRunning:Bool = false
    var selectedNumArray:[Int] = []
    
    var outputString = ""
    
    
    
    //start 버튼 난수 생성
    func creatRandomValue() -> [Int] {
        
        // 게임 시작 활성화
        isRunning = true
        
        // 난수 생성해서 인스턴스에 던져줌.
        while randomValueArray.count <= 2 {
            
            var randomValue1 = Int(arc4random_uniform(10))
            if !randomValueArray.contains(randomValue1) {
                
                randomValueArray.append(randomValue1)
            }
        }
        
        return randomValueArray
        
        
    }
    
    func reset() {
        
        //변수 초기화
        self.randomValueArray = []
        self.selectedNumArray = []
        self.isRunning = false
        
    }
    
    func numberbtn(n:Int) {
        
        if self.isRunning {
            
            if self.selectedNumArray.count == 0 {
                selectedNumArray.append(n)
                
                
            }else if selectedNumArray.count == 1 && !selectedNumArray.contains(n) {
                selectedNumArray.append(n)
                
            }else if selectedNumArray.count == 2 && !selectedNumArray.contains(n){
                selectedNumArray.append(n)
                
            }else if selectedNumArray.count >= 3 && !selectedNumArray.contains(n) {
                outputString = "이제그만..."
                
            }
            
            
            
            
        }
        
        
    }
    
    
        
    
    
        
    
    

}
