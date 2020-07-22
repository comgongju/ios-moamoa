//
//  CalendarViewModel.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/17.
//  Copyright © 2020 comgongju. All rights reserved.
//

import Foundation

struct CalendarViewModel {
    var date: Date
    var totalIncome: Int
    var totalSpending: Int
    var itemViewModel: [CalendarItemViewModel]
    
    init(date: Date, totalIncome: Int, totalSpending: Int) {
        self.date = date
        self.totalIncome = totalIncome
        self.totalSpending = totalSpending
        self.itemViewModel = []
        
        for i in 1...date.endOfMonth.day {
            guard let dailyDate = Calendar.current.date(bySetting: .day, value: i, of: date.startOfMonth) else { continue }
            itemViewModel.append(CalendarItemViewModel(date: dailyDate))
        }
    }
    
    subscript(_ date: Date) -> CalendarItemViewModel? {
        itemViewModel.first(where: { $0.date == date })
    }
}

