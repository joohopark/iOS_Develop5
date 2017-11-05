//
//  DataCenter.swift
//  Hackaton
//
//  Created by moonhohyeon on 2017. 11. 2..
//  Copyright © 2017년 FC. All rights reserved.
//

import Foundation

class DataCenter
{
    static var main: DataCenter = DataCenter()
    
    var dataModel: DataModel?
    
    private init()
    {
        loadExampleList()
    }
    
    func loadExampleList()
    {
        if let filePath = Bundle.main.path(forResource: "exampleList", ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: filePath) as? [String:Any]
        {
            dataModel = DataModel(dic: dic)
        }
    }
}
