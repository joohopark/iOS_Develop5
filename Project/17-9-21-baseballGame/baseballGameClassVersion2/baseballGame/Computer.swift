//
//  computer.swift
//  baseballGame
//
//  Created by MIN JUN JU on 2017. 9. 22..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation

class Computer {
    
    var getUserValueArray: [User] = []
    
    var getUserRandomValue: [Int] = []
    var getUserSelectedValue: [Int] = []
    
    var strike = 0
    var ball = 0
    var out = 0

    
    // user 의 인스턴스를 가지고옴
    func getUser(n:User) {
        
        getUserValueArray.append(n)
    }
    
    
    // user 의 value 값을 가져온다.
    func decompositionValue() {
        
        for i in getUserValueArray[0].randomValueArray {
            getUserRandomValue.append(i)
        }
        for i in getUserValueArray[0].selectedNumArray {
            getUserSelectedValue.append(i)
        }
    }
    
    func result() {
        
        //S, B, O 값
        for i in 0...2 {
            
            // 선택한 값이 난수 속에 있으면
            if getUserRandomValue.contains(getUserSelectedValue[i]) {
                
                // 인덱스가 같으면, strike +1
                if getUserSelectedValue[i] == getUserRandomValue[i] {
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
    
    func reset() {
        
        self.getUserRandomValue = []
        self.getUserSelectedValue = []
        self.getUserValueArray = []
        
        self.strike = 0
        self.ball = 0
        self.out = 0
    }
    
    func reset1() {
        self.getUserRandomValue = []
        self.getUserSelectedValue = []
        self.ball = 0
        self.strike = 0
        self.out = 0
    }
    
    
    
    
    
    
    
    
}
