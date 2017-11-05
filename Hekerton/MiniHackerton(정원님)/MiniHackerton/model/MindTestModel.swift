//
//  MindTestModel.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import Foundation
import RealmSwift

enum MindTestType: String {
    case d = "d"
    case i = "i"
    case s = "s"
    case c = "c"
}

enum MindTestIntType: Int {
    case d = 1
    case i = 2
    case s = 3
    case c = 4
}

struct MindTestRuntimeModel{
    var dataClosure: ((Int) -> MindTestExampleVO?)
    var currentDepth = 0
    var size: Int
    var resultStack: [Int] = []
    init(size: Int, closure: @escaping ((Int) -> MindTestExampleVO?)) {
        self.size = size
        dataClosure = closure
    }
    var currentData: MindTestExampleVO? {
        return dataClosure(currentDepth)
    }
    mutating func upCountDepth(){
        currentDepth += 1
    }
    mutating func appendResult(value: Int){
        resultStack.append(value)
    }
    var isResultFull: Bool {
        return size <= resultStack.count
    }
}

struct MindTestExampleVO: Decodable {
    var d: String
    var i: String
    var s: String
    var c: String
}

struct MindTestResultVO: Decodable {
    var d: MindTestResultContentVO
    var i: MindTestResultContentVO
    var s: MindTestResultContentVO
    var c: MindTestResultContentVO
    func getContent(value: Int) -> MindTestResultContentVO? {
        guard let tmp = MindTestIntType(rawValue: value) else {return nil}
        switch tmp {
        case .d: return d
        case .i: return i
        case .s: return s
        case .c: return c
        }
    }
}

struct MindTestResultContentVO: Decodable {
    var title: String
    var msg: String
}

class MindTestHistoryVO: Object {
    @objc dynamic var time: Date = Date()
    @objc dynamic var result: Int = 0
}
