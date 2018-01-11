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

class MJcalendarMager {
    
    class func nextMonth(with dateModel: MJcalendarDataModel) -> Date {
    
        let calendarIns = Calendar(identifier: .gregorian)
        
        var newComponets = DateComponents()
        newComponets.year = dateModel.year
        newComponets.month = dateModel.month + 1
        newComponets.day = dateModel.day
        
        if let nextDate = calendarIns.date(from: newComponets) {
            return nextDate
        }else {
            return Date()
        }
    }
    
    class func previousMonth(with nowDate: MJcalendarDataModel) -> Date? {
        
        let calendarIns = Calendar(identifier: .gregorian)
        
        var newComponets = DateComponents()
        newComponets.year = nowDate.year
        newComponets.month = nowDate.month - 1
        newComponets.day = nowDate.day
        
        if let nextDate = calendarIns.date(from: newComponets) {
            return nextDate
        }else {
            return Date()
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
    
    init?(date: Date) {
        
        // Calendar 셋팅
        // calendar를 통해서 -> componets에 값을 넣고, year, month 를 가지고 있음
        let calendarIns = Calendar(identifier: .gregorian)
        
        var components = calendarIns.dateComponents([.year, .month, .day], from: date)
        
        year = components.year ?? 0
        month = components.month ?? 0
        
        day = components.day ?? 0
        // 첫째 주 의, 요일을 뽑아오기 위해서 그 달의 첫번째 날ㅇ
        components.day = 1
        
        
        //각 년월의 1일은 date -> 1부터 시작함. 1은 일요일.
        guard let firstDayDate = calendarIns.date(from: components) else { return nil }
        
        // weekday가 요일을 숫자로 바꾸어 준다.
        var weekDayCompo = calendarIns.dateComponents([.weekday], from: firstDayDate)
        startWeekOfMonth = WeekDay.init(rawValue: weekDayCompo.weekday! - 1)!
        
        var addComponets = DateComponents()
        addComponets.month = 1
        addComponets.day = -1
        
        guard let lastDayDate = calendarIns.date(byAdding: addComponets, to: firstDayDate) else { return nil }
        lastDayOfMonth = calendarIns.dateComponents([.day], from: lastDayDate).day ?? 1
        
    }
}














