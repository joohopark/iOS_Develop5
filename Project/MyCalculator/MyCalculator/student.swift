//
//  student.swift
//  MyCalculator
//
//  Created by MIN JUN JU on 2017. 9. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation

class Student {
    var name:String
    var studentID:Int
    
    var subjects:[Subject] = [] // subject의 점수들을 모두 넣어서 []로 만들어줌.
    var totalGrade:String = "F"
    var totalScore:Int = 0
    var totalGradePoint:Double = 0.0
    
    
    init(name:String, id:Int) {
        self.name = name
        studentID = id
        
    }
    func setSubjects(subjects:[Subject])
    {
        self.subjects = subjects
        
        for s in subjects
        {
            totalScore += s.score
        }
        
    }
    func addSubject(subject:Subject)
    {
        self.subjects.append(subject)
        //선생님 풀이
        totalScore += subject.score
    }
    
    
    
}


