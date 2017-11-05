//
//  DataModel.swift
//  Hackaton
//
//  Created by moonhohyeon on 2017. 11. 2..
//  Copyright © 2017년 FC. All rights reserved.
//

import Foundation

class DataModel
{
    var array: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    var dataItem: DataItem!
    var currentPage = 0
    
    init?(dic: [String:Any])
    {
        array.shuffle()
        load(dic)
    }
    
    func load(_ dic: [String:Any])
    {
        if currentPage < 24
        {
            let index = array[currentPage]
            self.dataItem = DataItem(dic: dic["\(index)"] as! [String : String])
        }
    }
}
