//
//  ItemModel.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/22.
//  Copyright © 2020 comgongju. All rights reserved.
//

import Foundation

enum CategoryIcon: String {
    case coffee = "☕️"
}

struct Category {
    let icon: CategoryIcon
    let title: String
}

struct DailyHistoryModel {
    let createdDate: Date
    let category: Category
    let title: String
    let changeBudget: Int
}
