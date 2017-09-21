//
//  main.swift
//  9.21commandLine
//
//  Created by MIN JUN JU on 2017. 9. 21..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation





var random:[Int] = [1,2,3]

var value:[Int] = [2,5,6]

var ballValue = 0
var strikeValue = 0

for i in value {
    
    if random.contains(i) {
        ballValue += 1
        
    }else {
        
    }
    
}

print(ballValue, strikeValue)
