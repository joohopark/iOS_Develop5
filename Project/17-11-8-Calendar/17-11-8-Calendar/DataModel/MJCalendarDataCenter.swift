//
//  MJCalendarDataCenter.swift
//  17-11-8-Calendar
//
//  Created by MIN JUN JU on 2017. 11. 8..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation

enum WeekDay: Int {
    case Sun=0, Mon, Tue, Wed, Thu, Fri, Sat
    
    // WeekDay 의 해당 스트링값을 뱉러내기 위해서..
    var name: String {
        switch self {
        case .Sun:
            return "Sun"
        case .Mon:
            return "Mon"
        case .Tue:
            return "Tue"
        case .Wed:
            return "Wed"
        case .Thu:
            return "Thu"
        case .Fri:
            return "Fri"
        case .Sat:
            return "Sat"
        }
    }
}

struct MJcalendarDataModel {
    
    var year: Int
    var month: Int
    var day: Int
    
    // starWeekOfMonth 가 enum을 받음
    var startWeekOfMonth: WeekDay
    var lastDayOfMonth: Int
    
    init?(data: Date) {
        year = 2017
        month = 11
        day = 8
        startWeekOfMonth = .Wed
        lastDayOfMonth = 30
    }
}
