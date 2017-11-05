//
//  DataRepository.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import Foundation

protocol DataRepositoryProtocol {
    func getExmaplePlistData() -> Dictionary<String, MindTestExampleVO>?
    func getResultPlistData() -> MindTestResultVO?
}

class DataRepository: DataRepositoryProtocol {
    
    func plistLoad(forResource: String) -> Data? {
        guard let plistURL = Bundle.main.url(
            forResource: forResource,
            withExtension: "plist") else {return nil}
        
        return try? Data(contentsOf: plistURL)
    }
    
    func getExmaplePlistData() -> Dictionary<String, MindTestExampleVO>? {
        if let data = plistLoad(forResource: "exampleList") {
            return try? PropertyListDecoder().decode(
                Dictionary<String, MindTestExampleVO>.self, from: data)
        }
        return nil
    }
    
    func getResultPlistData() -> MindTestResultVO? {
        if let data = plistLoad(forResource: "resultList") {
            return try? PropertyListDecoder().decode(
                MindTestResultVO.self, from: data)
        }
        return nil
    }
}
