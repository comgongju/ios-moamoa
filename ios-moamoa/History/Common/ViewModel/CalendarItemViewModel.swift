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
    var dayHistory: [DailyHistoryModel]
    var dayTotalIncome: Int { dayHistory.map { $0.changeBudget }.reduce(0) { $1 > 0 ? $0 + $1 : $0} }
    var dayTotalSpending: Int { dayHistory.map { $0.changeBudget }.reduce(0) { $1 < 0 ? $0 + $1 : $0} }
    
    // temp init for test
    init(date: Date) {
        self.date = date
//        self.dayHistory = []
        self.dayHistory = [
            DailyHistoryModel(createdDate: date, category: Category(icon: .coffee, title: "커피냠냠"), title: "스타벅스 동대문점", changeBudget: -4000),
            DailyHistoryModel(createdDate: date, category: Category(icon: .coffee, title: "점심"), title: "서브웨이", changeBudget: -8000),
            DailyHistoryModel(createdDate: date, category: Category(icon: .coffee, title: "커피냠냠"), title: "할리스 동대문점", changeBudget: -5200),
            DailyHistoryModel(createdDate: date, category: Category(icon: .coffee, title: "급여"), title: "급여 입금", changeBudget: 5000000)
        ]
    }
}
