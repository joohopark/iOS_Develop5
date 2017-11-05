//
//  Data.swift
//  Hackaton
//
//  Created by moonhohyeon on 2017. 11. 2..
//  Copyright © 2017년 FC. All rights reserved.
//

import Foundation

class DataItem
{
    var d: String
    var i: String
    var s: String
    var c: String
    
    init?(dic: [String:String])
    {
        guard let d = dic["d"] else { return nil }
        self.d = d
        
        guard let i = dic["i"] else { return nil }
        self.i = i
        
        guard let s = dic["s"] else { return nil }
        self.s = s
        
        guard let c = dic["c"] else { return nil }
        self.c = c
    }
}
