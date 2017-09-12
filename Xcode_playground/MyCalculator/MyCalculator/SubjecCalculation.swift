//
//  SubjecCalculation.swift
//  MyCalculator
//
//  Created by MIN JUN JU on 2017. 9. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation


class SubjectCalculation {
    
    
    
    
    func calculation(student: Student) // 학생이름을 넣으면, student에서 값들이 튀어나게 하는 함수..?
    {
        var totalScore:Int = sumAllSubject(subjects: student.subjects)
        
        //평균
       
        
        
        
        
        
    }
    
    
    
    
    
    func sumAllSubject(subjects:[Subject]) -> Int //[Subject] Subject의 인스턴스만 들어올수 있다는 의미
    {
        
        var totalScore:Int = 0
        for s in subjects
        {
            totalScore += s.score
            
        }
        
        return totalScore
        
    }
    
    
    
    
    
    
}
