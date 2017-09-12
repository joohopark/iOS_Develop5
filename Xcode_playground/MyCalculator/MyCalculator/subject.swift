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
    
    
    
    
    
}
