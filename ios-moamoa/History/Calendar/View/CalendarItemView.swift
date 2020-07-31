//
//  CalendarItemView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/17.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct CalendarItemView: View {
    var viewModel: CalendarItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(self.viewModel.date, formatter: DateFormatter.onlyDate)")
                    .foregroundColor(self.viewModel.date.isDateInToday ? .subTextColor : .ssubTextColor)
                    .padding(.top, 8)
                    .padding(.leading, 7)
                    .font(.system(size: 13, weight: self.viewModel.date.isDateInToday ? .bold : .regular))
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                if self.viewModel.dayTotalIncome > 0 {
                    Text("+\(self.viewModel.dayTotalIncome)")
                        .font(.system(size: 10))
                        .foregroundColor(.incomeColor)
                }
                if self.viewModel.dayTotalSpending < 0 {
                    Text("\(self.viewModel.dayTotalSpending)")
                        .font(.system(size: 10))
                        .foregroundColor(.mainColor)
                }
            }.padding(.leading, 4)
            Spacer()
        }
    }
}

struct CalendarItemView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarItemView(viewModel: CalendarItemViewModel(
            date: Date(timeIntervalSince1970: 0))
        )
            .previewLayout(.fixed(width: 53, height: 80))
    }
}

