//
//  CalendarItemViewModel.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/17.
//  Copyright © 2020 comgongju. All rights reserved.
//

import Foundation

struct CalendarItemViewModel {
    var date: Date
    var dayHistory: [Int]
    var dayTotalIncome: Int { dayHistory.reduce(0) { $1 > 0 ? $0 + $1 : $0} }
    var dayTotalSpending: Int { dayHistory.reduce(0) { $1 < 0 ? $0 + $1 : $0} }
}
