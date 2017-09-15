//
//  subject.swift
//  MyCalculator
//
//  Created by MIN JUN JU on 2017. 9. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation
/*class Poketmon
{
    
    var name:String = ""
    var level:Int = 0
    var type:String = "normal" //
    
    init(name:String, level:Int) {
        self.name = name
        self.level = level
        
    }
    
    func getType(choiceType:String)
    {
        self.type = choiceType
        print("\(self.name)의 타입이 \(self.type) 가 되었습니다.")
    }
    
    func attack(taget:String)
    {
        
        
        print("\(self.name)가 \(taget) 을 공격합니다.")
        print("캬야아아아앙~!")
    }
    
} */

class Subject {
    
    var name:String = ""
    var score:Int = 0
    
    var grade:String = "F"
    var gradePoint:Double = 0.0
    
    init(name:String) {
        self.name = name
        
    }
    
    func setScore(s:Int)
    {
        self.score = s
    }
    
    // 선생님 풀이. 인스턴스를 넣으면 자동으로 몇등급인지 반환하는 함수를 만들어놓음. 
    func changeGrade()
    {
        if score > 0 && score <= 100
        {
            if score >= 95 {
                grade = "A+"
                
            }else if score >= 90 {
                grade = "A"
                
            }else if score >= 85 {
                grade = "B+"
            }else if score >= 80 {
                grade = "B"
            }
            
        }
        
        
    }
    
    
    
    
    
}
