//
//  Data.swift
//  CreatSubWay
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

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
        "안지랑","현충로","영대병원", "교대", "명덕", "반월당",
        "중앙로", "대구역", "칠성시장", "신천", "동대구역",
        "감삼", "두류", "내당", "반고개", "신남",
        "경대병원", "대구은행", "범어","수성구청","만촌"]      //12
    
    static let stations: [Station] = [
        //0
        Station(name: "안지랑", x: 400, y: 470, stationTimes: [
            (sn.index(of: "현충로")!,1)
            ]),
        //1
        Station(name: "현충로", x: 440, y: 455, stationTimes: [
            (sn.index(of: "안지랑")!,1),
            (sn.index(of: "영대병원")!,2)
            ]),
        //2
        Station(name: "영대병원", x: 465, y: 430, stationTimes: [
            (sn.index(of: "현충로")!,2),
            (sn.index(of: "교대")!,3)]),
        //3
        Station(name: "교대", x: 486, y: 410, stationTimes: [
            (sn.index(of: "영대병원")!,3),
            (sn.index(of: "명덕")!,4)]
        ),
        //4
        Station(name: "명덕", x: 515, y: 380, stationTimes: [
            (sn.index(of: "교대")!,4),
            (sn.index(of: "반월당")!,3)]),
        
        //5
        Station(name: "반월당", x: 575, y: 320, stationTimes: [
            (sn.index(of: "명덕")!,3),
            (sn.index(of: "중앙로")!,3),
            (sn.index(of: "신남")!,3),
            (sn.index(of: "경대병원")!,3)]),
        
        //6
        Station(name: "중앙로", x: 610, y: 290, stationTimes: [
            (sn.index(of: "반월당")!,3),
            (sn.index(of: "대구역")!,4)]),
        
        //7
        Station(name: "대구역", x: 640, y: 265, stationTimes: [
            (sn.index(of: "중앙로")!,4),
            (sn.index(of: "칠성시장")!,3)]),
        
        //8
        Station(name: "칠성시장", x: 690, y: 265, stationTimes: [
            (sn.index(of: "대구역")!,3),
            (sn.index(of: "신천")!,4)]),
        
        //9
        Station(name: "신천", x: 738, y: 265, stationTimes: [
            (sn.index(of: "칠성시장")!,4),
            (sn.index(of: "동대구역")!,3)]),
        
        //10
        Station(name: "동대구역", x: 785, y: 265, stationTimes: [
            (sn.index(of: "신천")!,3)]),
        
        //11
        Station(name: "감삼", x: 785, y: 265, stationTimes: [
            (sn.index(of: "두류")!,3)]),
        
        //12
        Station(name: "두류", x: 738, y: 265, stationTimes: [
            (sn.index(of: "감삼")!,3),
            (sn.index(of: "내당")!,4)]),
        
        //13
        Station(name: "내당", x: 430, y: 320, stationTimes: [
            (sn.index(of: "두류")!,4),
            (sn.index(of: "반고개")!,3)]),
        
        //14
        Station(name: "반고개", x: 475, y: 320, stationTimes: [
            (sn.index(of: "신남")!,4),
            (sn.index(of: "내당")!,3)]),
        
        //15
        Station(name: "신남", x: 545, y: 320, stationTimes: [
            (sn.index(of: "반월당")!,3),
            (sn.index(of: "반고개")!,4)]),
        
        //16
        Station(name: "경대병원", x: 640, y: 320, stationTimes: [
            (sn.index(of: "반월당")!,3),
            (sn.index(of: "대구은행")!,4)]),
        
        //17
        Station(name: "대구은행", x: 680, y: 320, stationTimes: [
            (sn.index(of: "경대병원")!,4),
            (sn.index(of: "범어")!,3)]),
        
        //18
        Station(name: "범어", x: 730, y: 320, stationTimes: [
            (sn.index(of: "대구은행")!,3),
            (sn.index(of: "수성구청")!,4)]),
        
        //19
        Station(name: "수성구청", x: 780, y: 320, stationTimes: [
            (sn.index(of: "범어")!,4),
            (sn.index(of: "만촌")!,3)]),
        
        Station(name: "만촌", x: 830, y: 340, stationTimes: [
            (sn.index(of: "수성구청")!,3)])
    ]
}
