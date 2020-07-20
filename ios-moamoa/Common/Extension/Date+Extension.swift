//
//  Date+Extension.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/20.
//  Copyright © 2020 comgongju. All rights reserved.
//

import Foundation

extension Date {
    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
    
    var weekNumOfMonth: Int {
        // 한 주의 시작을 일요일을 기준으로 계산하기 때문에 마지막 날이 일요일인 경우 마지막 한 주를 제외한다. 마찬가지로 해당 월의 시작일이 일요일이라면 한 주를 더해준다.
        let endDateOfMonth = Calendar.current.dateComponents([.weekOfMonth, .weekday], from: self.endOfMonth)
        let weekNumOfMonth = endDateOfMonth.weekday == 1 ? endDateOfMonth.weekOfMonth! - 1 : endDateOfMonth.weekOfMonth!
        return self.startOfMonth.weekday == 6 ? weekNumOfMonth + 1 : weekNumOfMonth
    }
    
    var month: Int {
        return Calendar.current.dateComponents([.month], from: self).month!
    }
    
    var day: Int {
        return Calendar.current.dateComponents([.day], from: self).day!
    }
    
    var weekday: Int {
        let weekday = Calendar.current.dateComponents([.weekday], from: self).weekday!
        return weekday == 1 ? 6 : weekday - 2
    }
    
    var isDateInToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
