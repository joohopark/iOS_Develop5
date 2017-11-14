//
//  dataViewController.swift
//  testDiecstra
//
//  Created by MIN JUN JU on 2017. 10. 13..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

import UIKit

struct Station{
    var name: String
    var x: Int
    var y: Int
    var stationTimes: [(sIndex: Int,time: Int)]
    let width: Int = 20
    let height: Int = 20
    func getCGRect() -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    static let sn = [
        "영대병원", "교대", "명덕", "반월당", "중앙로", "대구역", "칠성시장",
        "내당", "반고개", "신남", "경대병원", "대구은행", "범어"]      //12
    
    static let stations: [Station] = [
        Station(name: "영대병원", x: 465, y: 430, stationTimes: [
            (sn.index(of: "교대")!,3)
            ]),    //0
        Station(name: "교대", x: 486, y: 410, stationTimes: [
            (sn.index(of: "영대병원")!,3),
            (sn.index(of: "명덕")!,4)]
        ), //1
        Station(name: "명덕", x: 515, y: 380, stationTimes: [
            (sn.index(of: "교대")!,4),
            (sn.index(of: "반월당")!,3)
            ]), //2
        Station(name: "반월당", x: 575, y: 320, stationTimes: [
            (sn.index(of: "명덕")!,3),
            (sn.index(of: "중앙로")!,3),
            (sn.index(of: "신남")!,3),
            (sn.index(of: "경대병원")!,3)
            ]),   //3
        Station(name: "중앙로", x: 610, y: 290, stationTimes: [
            (sn.index(of: "반월당")!,3),
            (sn.index(of: "대구역")!,4)
            ]),   //4
        Station(name: "대구역", x: 640, y: 265, stationTimes: [
            (sn.index(of: "중앙로")!,4),
            (sn.index(of: "칠성시장")!,3)
            ]),   //5
        Station(name: "칠성시장", x: 690, y: 265, stationTimes: [
            (sn.index(of: "대구역")!,3)
            ]), //6
        Station(name: "내당", x: 430, y: 320, stationTimes: [
            (sn.index(of: "반고개")!,3)
            ]),    //7
        Station(name: "반고개", x: 475, y: 320, stationTimes: [
            (sn.index(of: "신남")!,4),
            (sn.index(of: "내당")!,3)
            ]),   //8
        Station(name: "신남", x: 545, y: 320, stationTimes: [
            (sn.index(of: "반월당")!,3),
            (sn.index(of: "반고개")!,4)
            ]),    //9
        Station(name: "경대병원", x: 640, y: 320, stationTimes: [
            (sn.index(of: "반월당")!,3),
            (sn.index(of: "대구은행")!,4)
            ]), //10
        Station(name: "대구은행", x: 680, y: 320, stationTimes: [
            (sn.index(of: "경대병원")!,4),
            (sn.index(of: "범어")!,3)
            ]), //11
        Station(name: "범어", x: 730, y: 320, stationTimes: [
            (sn.index(of: "대구은행")!,3)
            ])      //12
    ]
}




