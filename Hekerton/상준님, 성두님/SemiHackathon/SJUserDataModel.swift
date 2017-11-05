//
//  SJUserDataModel.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import UIKit

struct User{
    static var main = User()
    private var resultScoreByType: [PersonalityType: CGFloat]
    private init(){
        resultScoreByType = [.D: 0, .I: 0, .S: 0, .C: 0]
    }
    mutating func increaseScore(of type: PersonalityType){
        resultScoreByType[type]! += 1
    }
    
    private var guess: String = ""
    
    var myGuess: String {
        get{
            return guess
        }
        set{
            guess = newValue
        }
    }
    
    var point: Point{
        var x: CGFloat = 0
        var y: CGFloat = 0
        for (type, score) in resultScoreByType{
            switch type{
            case .D:
                x -= score
                y += score
            case .I:
                x += score
                y += score
            case .S:
                x += score
                y -= score
            case .C:
                x -= score
                y -= score
            }
        }
        return Point(x: x, y: y)
    }

    var personalityType: PersonalityType? {
        let x = point.x
        let y = point.y
        if x < 0 && y > 0{
            return .D
        } else if x > 0 && y > 0{
            return .I
        } else if x > 0 && y < 0{
            return .S
        } else if x < 0 && y < 0{
            return .C
        } else{
            return nil
        }
        
    }
}
