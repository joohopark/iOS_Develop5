//
//  SubjecCalculation.swift
//  MyCalculator
//
//  Created by MIN JUN JU on 2017. 9. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation


class SubjectCalculation {
    
    var calname:String = ""
    var totalValue = 0
   
    
    
    init(calName:String)
    {
        self.calname = calName
    }
    
    func calculation(student: Student)  // 학생이름을 넣으면, student에서 값들이 튀어나게 하는 함수..?
    {
        // self.subjects.append(subject)
        
        
        for i in 0...student.subjects.count-1 { // index 넘버들을 가져옴.
            
            totalValue += student.subjects[i].score
            
        }
        let avg:Int = totalValue/student.subjects.count
        
        print("\(student.name)의 평균은 \(avg) 입니다.")
        
        
        
        
        
        
        
        /*
        var totalScore:Int = sumAllSubject(subjects: student.subjects)
        
        //평균 */
       
        
    }
    
//    func claculationAnswer(student: Student)
//    {
//        // 평균 구하기 선생님 풀이
//        var totalScore:Int = 0
//        var subjects = student.subjects
//        
//        for subject in subjects
//        {
//            totalScore += subject.score
//            
//            
//        }
//        // 모두 더한값을 점수의 과목수로 나누어서 연산해보면 바로 연산이 됨.
//        
//        student.
//        
//    }
//    
//    
    
    
    
    /*func sumAllSubject(subjects:[Subject]) -> Int //[Subject] Subject의 인스턴스만 들어올수 있다는 의미
    {
        
        var totalScore:Int = 0
        for s in subjects
        {
            totalScore += s.score
            
        }
        
        return totalScore
        
    } */
    
    
    
    
    
    
}
