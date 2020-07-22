//
//  DateFormatter+Extension.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/17.
//  Copyright © 2020 comgongju. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let yearCommaMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY, MM"
        return formatter
    }()
    
    static let onlyDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    static let withDot: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY. MM. dd"
        return formatter
    }()
}
