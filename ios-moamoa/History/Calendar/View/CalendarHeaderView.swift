//
//  CalendarHeaderView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/20.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct CalendarHeaderView: View {
    init(totalIncome: Int, totalSpending: Int) {
        self.totalIncome = totalIncome
        self.totalSpending = totalSpending
    }
    
    var totalIncome: Int
    var totalSpending: Int
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 6) {
                Spacer()
                Circle()
                    .frame(width: 11, height: 11)
                    .foregroundColor(Color(red: 0.879, green: 0.201, blue: 0.337, opacity: 1))
                Text(Str.incomeText)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.subTextColor)
                Text("\(abs(self.totalIncome))")
                    .font(.system(size: 14))
                    .foregroundColor(.subTextColor)
                Spacer()
            }
            
            HStack(spacing: 6) {
                Spacer()
                Circle()
                    .frame(width: 11, height: 11)
                    .foregroundColor(.mainColor)
                Text(Str.spendingText)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.subTextColor)
                Text("\(abs(self.totalSpending))")
                    .font(.system(size: 14))
                    .foregroundColor(.subTextColor)
                Spacer()
            }
        }.padding(.top, 21)
            .padding(.bottom, 18)
    }
}

struct CalendarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeaderView(totalIncome: 1234567, totalSpending: 1234567)
            .previewLayout(.fixed(width: 375, height: 54))
    }
}
