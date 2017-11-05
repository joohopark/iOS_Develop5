//
//  Util.swift
//  SemiHackathon
//
//  Created by esung on 2017. 11. 2..
//  Copyright © 2017년 esung. All rights reserved.
//

import Foundation

func generateRandomArray(with length:Int)->[Int]{
    var array:[Int] = []
    for _ in 0..<length{
        var randomNumber = Int(arc4random_uniform(UInt32(length)))
        while(array.contains(randomNumber)){
            randomNumber = Int(arc4random_uniform(UInt32(length)))
        }
        array.append(randomNumber)
    }
    return array
}
